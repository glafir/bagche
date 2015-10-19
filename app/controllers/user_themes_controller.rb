class UserThemesController < ApplicationController
  before_filter :set_user_theme, only: [:show, :edit, :update, :destroy]

  def index
    @user_themes = UserTheme.all
    respond_with(@user_themes)
  end

  def show
    respond_with(@user_theme)
  end

  def new
    @user_theme = UserTheme.new
    respond_with(@user_theme)
  end

  def edit
  end

  def create
    @user_theme = UserTheme.new(params[:user_theme])
    @user_theme.save
    respond_with(@user_theme)
  end

  def update
    @user_theme.update_attributes(params[:user_theme])
    respond_with(@user_theme)
  end

  def destroy
    @user_theme.destroy
  end

  private
    def set_user_theme
      @user_theme = UserTheme.find(params[:id])
    end
end
