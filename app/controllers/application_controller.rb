# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
include Pundit
protect_from_forgery with: :exception, unless: -> { request.format.json? }
skip_before_filter :verify_authenticity_token, if: -> { controller_name == 'sessions' && action_name == 'create' }
skip_before_action :verify_authenticity_token, if: :json_request?
#after_action :logging, only: [:create, :update, :destroy]
require 'devise_traceable'
#require 'suncalc'
before_filter :authenticate_user!, :except => [:error_404, :error_403]
helper_method :sort_column, :sort_direction

#require 'date'
#layout :layout_by_resource
#def store_location
#  session[:return_to] = request.fullpath
#end
before_filter :force_utf8_params
before_filter  :set_p3p
#before_action :set_locale
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

#before_filter :set_mobile_format
#has_mobile_fu
#before_filter :force_mobile_format


before_filter :set_timezone 

respond_to :html, :js, :json, :mobile
after_action :verify_authorized, :except => [:error_404, :error_403]
rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

def role?(role)
  return !!self.roles.find_by_name(role.to_s.camelize)
end

def set_timezone
    tz = current_user ? current_user.time_zone : nil
    Time.zone = tz || ActiveSupport::TimeZone["Moscow"]
end  
 
def validator(object)
  object.valid?
  model = object.class.name.underscore.to_sym
  field = params[model].first[0]
  @errors = object.errors[field]

  if @errors.empty?
    @errors = true
  else
    name = t("activerecord.attributes.#{model}.#{field}")
    @errors.map! { |e| "#{name} #{e}<br />" }
  end
end

#  def create
#    @flash_message_state_id = 401
#  end

#  def update
#    @flash_message_state_id = 402
#  end

#  def destroy
#    @flash_message_state_id = 405
#  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

  def force_utf8_params
  traverse = lambda do |object, block|
    if object.kind_of?(Hash)
      object.each_value { |o| traverse.call(o, block) }
    elsif object.kind_of?(Array)
      object.each { |o| traverse.call(o, block) }
    else
      block.call(object)
    end
    object
  end
  force_encoding = lambda do |o|
    o.force_encoding(Encoding::UTF_8) if o.respond_to?(:force_encoding)
  end
  traverse.call(params, force_encoding)
  end

  def after_sign_in_path_for(resource)
    @flash = flash[:notice]
    @flash_message_state_id = 100
    flash_message_add
    request.referrer || user_path and return
  end

#  def after_sign_out_path_for(resource_or_scope)
#    new_user_session_path
#  end

  def set_p3p
    response.headers["P3P"]='CP="CAO PSA OUR"'
  end 

  private 
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def record_not_found
    render "errors/error_404", status: 404
  end

#  def set_mobile_format
#    if is_mobile_device? # this method is provided by mobile_fu
#      is_device?("iPhone") ? request.format = :html : super
#      if (devise_controller? && action_name == 'create' && request.method == ('POST'))
#        request.format = :html
#      else
#        request.format = :mobile
#      end
#    end
#  end

  def logging
    @flash = flash[:notice]
    flash_message_add
  end

  protected

  def user_not_authorized
    flash[:notice] = "Данное действие тебе не разрешено."
    @flash = flash[:notice]
    @flash_message_state_id = 403
    flash_message_add
    redirect_to (request.referrer || error403_path), data: { no_turbolink: true } and return
  end

  def flash_message_add
    @flash_message = FlashMessage.new
    current_user.nil? ? @flash_message.user_id = 0 : @flash_message.user_id =  current_user.id
    @flash_message.request_url = request.original_url
    @flash_message.request_ip = request.ip
    @flash_message.request_method = request.request_method
    request.referrer.nil? ? @flash_message.request_referrer = request.original_url : @flash_message.request_referrer = request.referrer
    @flash_message.useragent = request.env['HTTP_USER_AGENT']
    @flash_message.message = @flash
    @flash_message.flash_message_state_id = @flash_message_state_id
    @flash_message.save
  end

  def layout_by_resource
    if devise_controller?
      "application_empty_1"
    else
      "application"
    end
  end

  def json_request?
    request.format.json?
  end
end
