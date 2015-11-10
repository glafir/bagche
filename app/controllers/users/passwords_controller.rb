class Users::PasswordsController < Devise::PasswordsController
  before_filter :check_permissions
#  after_action :verify_authorized, :except => [:new, :create]
skip_after_action :verify_authorized

  # GET /resource/password/new
  def new
    super
  end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  # def update
  #   super
  # end

  # protected

  # def after_resetting_password_path_for(resource)
  #   super(resource)
  # end

  # The path used after sending reset password instructions
  # def after_sending_reset_password_instructions_path_for(resource_name)
  #   super(resource_name)
  # end
  protected

  def check_permissions
    authorize :user_password
  end
end
