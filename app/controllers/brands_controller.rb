class BrandsController < ApplicationController
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]


  # GET /brands
  def index
    @brands = Brand.all.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize Brand.all
    respond_with @brands
  end

  # GET /brands/1
  def show
    authorize @brand
    respond_with @brand
  end

  # GET /brands/new
  def new
    @brand = Brand.new
    authorize @brand
    respond_with @brand
  end

  # GET /brands/1/edit
  def edit
    authorize @brand
  end

  # POST /brands
  def create
    @brand = Brand.new(brand_params)
    @brand.save
    flash[:notice] =  'The brand was successfully saved!' if @brand.save && !request.xhr?
    authorize @brand
    respond_with @brand
  end

  # PATCH/PUT /brands/1
  def update
    @brand.update(brand_params)
    flash[:notice] =  'The brand was successfully updated!' if @brand.update(brand_params) && !request.xhr?
    authorize @brand
    respond_with @brand
  end

  # DELETE /brands/1
  def destroy
    @brand.destroy
    authorize @brand
    redirect_to brands_url, notice: 'Brand was successfully destroyed.' if @brand.destroy && !request.xhr?
#    respond_with @brand
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brand
      @brand = Brand.find(params[:id])
    end

    def sort_column
      Brand.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def brand_params
      params.require(:brand).permit(:namebrand, :country_id, :logotip)
    end
end
