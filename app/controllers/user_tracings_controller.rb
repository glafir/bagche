class UserTracingsController < ApplicationController
  before_filter :set_user_tracing, only: [:show]
  before_filter :authenticate_user!

  def index
    @user_tracings = UserTracing.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize UserTracing
  end

  def show
    authorize @user_tracing
  end

  def edit
    authorize UserTracing
    render nothing: true
  end

  def update
    authorize UserTracing
    render nothing: true
  end

  def new
    authorize UserTracing
    render nothing: true
  end

  def create
    authorize UserTracing
    render nothing: true
  end

  def destroy
    authorize UserTracing
    render nothing: true
  end

private
  def sort_column
    UserTracing.column_names.include?(params[:sort]) ? params[:sort] : "sign_in_at"
  end

  def set_user_tracing
    @user_tracing = UserTracing.find(params[:id])
  end
end
