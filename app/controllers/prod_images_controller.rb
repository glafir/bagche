class ProdImagesController < ApplicationController
  before_action :set_prod_image, only: [:show, :edit, :update, :destroy]
  before_action :set_product
  before_filter :authenticate_user!, :except => [:index, :show]


  # GET /prod_images
  def index
    @prod_images = @product.prod_images.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize @prod_images
    respond_with @prod_images
  end

  # GET /prod_images/1
  def show
    authorize @prod_image
    respond_with @prod_image
  end

  # GET /prod_images/new
  def new
    @prod_image = ProdImage.new
    authorize @prod_image
    respond_with @prod_image
  end

  # GET /prod_images/1/edit
  def edit
    authorize @prod_image
  end

  # POST /prod_images
  def create
    @prod_image = ProdImage.new(prod_image_params)
    authorize @prod_image
    @prod_image.save
    flash[:notice] =  'The prod_image was successfully saved!' if @prod_image.save && !request.xhr?
    respond_with @prod_image, :location => product_path(@product)
  end

  # PATCH/PUT /prod_images/1
  def update
    @prod_image.update(prod_image_params)
    authorize @prod_image
    flash[:notice] =  'The prod_image was successfully updated!' if @prod_image.update(prod_image_params) && !request.xhr?
    redirect_to product_prod_images_url
  end

  # DELETE /prod_images/1
  def destroy
    authorize @prod_image
    @prod_image.destroy
    redirect_to product_prod_images_url, notice: 'Prod image was successfully destroyed.' if @prod_image.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prod_image
      @prod_image = ProdImage.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end

    def sort_column
      ProdImage.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def prod_image_params
      params.require(:prod_image).permit(:prodimage, :product_id)
    end
end
