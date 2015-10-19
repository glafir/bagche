class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /orders
  def index
#    if current_user.user? or current_user.client?
#      @orders = @user.orders.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
#    else
#      @orders = Order.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
#    end
    authorize Order
    @orders = OrderPolicy::Scope.new(current_user, Order).resolve.page(params[:page]).per(params[:limit])
    respond_with @orders
  end

  # GET /orders/1
  def show
    authorize @order
    if @user.manager?
      @order.state_id = 2 if @order.state_id == 1
      if @order.save
        @order_history = OrderHistory.new
        @order_history.order_id = @order.id
        @order_history.comment_id = 0
        @order_history.user_id = current_user.id
        @order_history.history_store = "Заказ №#{@order.id} Просмотрен менеджером #{current_user.username} в #{@order.update_at}."
        @order_history.save
      end 
    end
    respond_with @order
  end

  # GET /orders/new
  def new
    @order = Order.new
    authorize @order
    respond_with @order
  end

  # GET /orders/1/edit
  def edit
    authorize @order
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    authorize @order
    if @order.save
      @order_history = OrderHistory.new
      @order_history.order_id = @order.id
      @order_history.comment_id = 0
      @order_history.user_id = current_user.id
      @order_history.history_store = "Заказ №#{@order.id} создан."
      @order_history.save
    end
    flash[:notice] = 'Заказ №#{@order.id} создан успешно!' if @order.save && !request.xhr?
#    respond_with @order, :location => user_path(@user)
    redirect_to user_orders_url
  end

  # PATCH/PUT /orders/1
  def update
    authorize @order
    @order.update(order_params)
    flash[:notice] =  'The order was successfully updated!' if @order.update(order_params) && !request.xhr?
    redirect_to user_order_url
  end

  # DELETE /orders/1
  def destroy
    authorize @order
    @order.destroy
    redirect_to user_orders_url, notice: 'Order was successfully destroyed.' if @order.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    def sort_column
      Order.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, :manager_id, :order_state_id, :product_id)
    end

    def set_user
      @user = User.find(params[:user_id])
    end
end
