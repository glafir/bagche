class AdminController < ApplicationController
  include Netzke::Railz::ControllerExtensions
  before_filter :authenticate_user!
  before_filter :check_permissions, :only => [:index, :ext, :direct, :dispatcher]
  skip_before_filter :require_no_authentication
  protect_from_forgery :except => [:index, :ext, :direct, :dispatcher]
  protected

  def check_permissions
    authorize :admin
  end
end
