class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :check_permissions, :only => [:cancel, :edit, :update]
  skip_before_filter :require_no_authentication
  before_filter :configure_permitted_parameters
  after_action :verify_authorized, :except => [:new, :create]

  protected

  def check_permissions
    authorize :user_registration
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up).push(:username, :email, :time_zone, :town_id, :user_theme_id, :avatar, :nickname, :provider, :url, :uid)
    devise_parameter_sanitizer.for(:account_update).push(:username, :email, :time_zone, :town_id, :user_theme_id, :avatar, :nickname, :provider, :url, :uid)
  end

  def after_update_path_for(resource)
    @flash = flash[:notice]
    @flash_message_state_id = 202
    flash_message_add
    user_path(resource)
  end
end
