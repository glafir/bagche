class TownsController < ApplicationController
  before_filter :set_town, only: [:show, :edit, :update, :destroy]
  before_filter :check_permissions, only: :autocomplete_town_accent_city
  before_filter :load_parent, except: :autocomplete_town_accent_city

  autocomplete :town, :accent_city, :limit => 50, :display_value => :twdata, :extra_data => [:city, :accent_city, :country_iso, :latitude, :longitude]

  def admin_tw
    render layout: "application_empty_1"
  end

  def index
    @towns = @country.towns.search(params[:search]).order(sort_column + " " + sort_direction)
    @towns = @towns.page(params[:page]).per(params[:per_page])
    authorize Town
    respond_with(@towns)
  end

  def apToTw
    @airports = Airport.all
    @airports.each do |airport|
      @apkey = Apkey.new
      @apkey.id = airport.id if apkey.id.blank?
      @apkey.airport_id = airport.id if apkey.airport_id.blank?
      @apkey.save
    end
  authorize Airport
  end

  def show
    @airports = Airport.where(town_id: @town.id)
    @airports = @airports.page(params[:page]).per(params[:per_page])
    authorize @town
    respond_with(@town)
  end

  def new
    @town = Town.new
    authorize @town
    respond_with(@town)
  end

  def edit
    authorize @town
  end

  def create
    @town = Town.new(params[:town])
    @town.save
    flash[:notice] = "The town  #{@town.id} was created!" if @town.save && !request.xhr?
    @flash_message_state_id = 401
    authorize @town
    respond_with @country
  end

  def update
    @town.update_attributes(params[:town])
    flash[:notice] = "The town  #{@town.id} was updated!" if @town.update_attributes(params[:airport]) && !request.xhr?
    @flash_message_state_id = 402
    authorize @town
    respond_with @country
  end

  def destroy
    @town.destroy 
    redirect_to towns_url, notice: "The town  #{@town.id} was destroied!" if @town.destroy && !request.xhr?
    authorize @town
  end

  def tw_dist
    @ap1 = Town.find(params[:start_ap]) if params[:start_ap] != nil
    @ap2 = Town.find(params[:end_ap]) if params[:end_ap] != nil
    if @ap1 != nil || @ap2 != nil
      @p1 = GeoPoint.new  @ap1.latitude.to_f, @ap1.longitude.to_f
      @p2 = GeoPoint.new  @ap2.latitude.to_f, @ap2.longitude.to_f
      @dist = @p1.distance_to(@p2)
    end
    authorize Town
  end

private
  def sort_column
    Town.column_names.include?(params[:sort]) ? params[:sort] : "country_id"
  end

  def set_town
    @country = Country.find(params[:country_id])
    @town = @country.towns.find(params[:id])
  end

  def load_parent
    @country = Country.find(params[:country_id])
  end

  protected

  def check_permissions
    authorize :town
  end
end
