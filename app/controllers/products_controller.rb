class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  after_action :verify_authorized, :except => [:index, :show]
  def import
    authorize Product
    Product.import(params[:file])
    redirect_to root_url, notice: "Products imported."
  end

  # GET /products
  def index
    @products = Product.all.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
#    authorize Product.all
    respond_with @products
  end

  # GET /products/1
  def show
    @prod_images = @product.prod_images
#    authorize @product
    respond_with @product
  end

  # GET /products/new
  def new
    @product = Product.new
    authorize @product
    respond_with @product
  end

  # GET /products/1/edit
  def edit
    authorize @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)
    @product.save
    flash[:notice] =  'The product was successfully saved!' if @product.save && !request.xhr?
    authorize @product
    respond_with @product
  end

  # PATCH/PUT /products/1
  def update
    @product.update(product_params)
    flash[:notice] =  'The product was successfully updated!' if @product.update(product_params) && !request.xhr?
    authorize @product
    respond_with @product
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    authorize @product
    redirect_to products_url, notice: 'Product was successfully destroyed.' if @product.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def sort_column
      Product.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:brand_id, :name, :artcode, :quantity, :price, :description)
    end
end
