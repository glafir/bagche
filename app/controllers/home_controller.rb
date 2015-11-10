class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :catalog, :about]
  after_action :verify_authorized, :except => [:index, :catalog, :about]
  layout "home"

  def index
  end

  def catalog
    @products = Product.where(publish: 1).page(params[:page]).per(params[:limit])
    @brands = Product.group("brand_id")
  end

  def about
  end
end
