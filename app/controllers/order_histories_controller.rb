class OrderHistoriesController < ApplicationController
  before_action :set_order_history, only: :show
  before_action :set_order

  # GET /order_histories
  def index
    @order_histories = @order.order_histories.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize @order_histories
    respond_with @order_histories
  end

  # GET /order_histories/1
  def show
    authorize @order_history
    respond_with @order_history
  end

  # GET /order_histories/new
  def new
#    @order_history = OrderHistory.new
    authorize OrderHistory
    render nothing: true
#    respond_with @order_history
  end

  # GET /order_histories/1/edit
  def edit
    authorize OrderHistory
    render nothing: true
  end

  # POST /order_histories
  def create
    authorize OrderHistory
    render nothing: true

#    @order_history = OrderHistory.new(order_history_params)
#    authorize @order_history
#    @order_history.save
#    flash[:notice] =  'The order_history was successfully saved!' if @order_history.save && !request.xhr?
#    respond_with @order_history
    render nothing: true
  end

  # PATCH/PUT /order_histories/1
  def update
#    @order_history.update(order_history_params)
    authorize OrderHistory
#    flash[:notice] =  'The order_history was successfully updated!' if @order_history.update(order_history_params) && !request.xhr?
#    respond_with @order_history
    render nothing: true
  end

  # DELETE /order_histories/1
  def destroy
    authorize OrderHistory
    render nothing: true
#    @order_history.destroy
#    redirect_to order_histories_url, notice: 'Order history was successfully destroyed.'  if @order_history.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_history
      @order_history = OrderHistory.find(params[:id])
    end

    def sort_column
      OrderHistory.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def order_history_params
      params.require(:order_history).permit(:order_id, :history_store, :comment_id)
    end

    def set_order
      @user = User.find(params[:user_id])
      @order = Order.find(params[:order_id])
    end
end
