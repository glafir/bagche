class UsersController < ApplicationController
#  force_ssl
  before_filter :authenticate_user!
  before_filter :set_user, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized
  def index
    @users = User.all
    authorize User
  end

  def show
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    if @user.save
      redirect_to current_user, :notice => "User #{@user.username} was successfully created."
    else
      render :new, :notice => "User can`t creat."
    end
  end

  def update
    authorize @user
    if @user.update_attributes(user_params)
      redirect_to @user, :notice => "User #{@user.username} updated."
    else
      render :edit, :notice => "Unable to update user #{@user.username}."
    end
  end

  def destroy
    user = User.find(params[:id])
    user_d = user.username
    authorize user
    user.destroy
    redirect_to users_path, :notice => "User #{user_d} deleted."
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :time_zone, :town_id, :user_theme_id, :role, :avatar, :aircompany_id, :nickname, :provider, :url)
  end
end
