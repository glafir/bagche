class CountriesController < ApplicationController
  before_filter :set_country, only: [:show, :tw_show, :edit, :update, :destroy]
  before_filter :set_towns, only: [:tw_show, :show]

  def index
    @countries = Country.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    @model_class = Country
    @modelses = @countries
    authorize Country
    respond_with(@countries)
  end

  def tw_show
    authorize @country
    respond_with(@country)
  end

  def show
    authorize @country
    respond_with(@country)
  end

  def new
    @country = Country.new
    authorize @country
    respond_with(@country)
  end

  def edit
    authorize @country
  end

  def create
    @country = Country.new(params[:country])
    @country.save
    flash[:notice] = 'The Country was successfully created!' if @country.save && !request.xhr?
    authorize @country
    respond_with(@country)
  end

  def update
    @country.update_attributes(params[:country])
    flash[:notice] = 'The Country was successfully updated!' if @country.update_attributes(params[:country]) && !request.xhr?
    authorize @country
    respond_with(@country)
  end

  def destroy
    @country.destroy
    authorize @country
  end

private
  def sort_column
    Country.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end

  def sort_column_t
    Town.column_names.include?(params[:sort]) ? params[:sort] : "city"
  end

  def set_country
    @country = Country.find(params[:id])
  end

  def set_towns
    @towns = @country.towns.search(params[:search]).order(sort_column_t + " " + sort_direction).page(params[:page]).per(params[:limit])
    params[:page] = 1.to_i if params[:page].nil?
    params[:page] = params[:page].to_i + 1.to_i
  end
end
