class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => :show
  after_action :verify_authorized, :except => :show
  def import
    authorize Product
    Product.import(params[:file])
    redirect_to products_path, notice: "Products imported."
  end

  # GET /products
  def index
    @products = Product.page(params[:page]).per(params[:limit])
    @brands = Product.group("brand_id")
    authorize @products
    respond_with @products
  end

  # GET /products/1
  def show
    @prod_images = @product.prod_images
#    @orders = @product.orders.page(params[:page]).per(params[:limit])
    @orders = OrderPolicy::Scope.new(current_user, Order).resolve.where(product_id: @product.id).page(params[:page]).per(params[:limit]) if user_signed_in?
    @comments = @product.comments.last(10)
    @comment = Comment.new(params[:comment_id])
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
      @item = Product.find(params[:id])
    end

    def sort_column
      Product.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:brand_id, :name, :artcode, :quantity, :price, :description)
    end
end
