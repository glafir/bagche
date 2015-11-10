class OrderStatesController < ApplicationController
  before_action :set_order_state, only: [:show, :edit, :update, :destroy]


  # GET /order_states
  def index
    @order_states = OrderState.all.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize OrderState.all
    respond_with @order_states
  end

  # GET /order_states/1
  def show
    authorize @order_state
    @comments = @order.comments
    respond_with @order_state
  end

  # GET /order_states/new
  def new
    @order_state = OrderState.new
    authorize @order_state
    respond_with @order_state
  end

  # GET /order_states/1/edit
  def edit
    authorize @order_state
  end

  # POST /order_states
  def create
    @order_state = OrderState.new(order_state_params)
    @order_state.save
    flash[:notice] =  'The order_state was successfully saved!' if @order_state.save && !request.xhr?
    authorize @order_state
    respond_with @order_state
  end

  # PATCH/PUT /order_states/1
  def update
    @order_state.update(order_state_params)
    flash[:notice] =  'The order_state was successfully updated!' if @order_state.update(order_state_params) && !request.xhr?
    authorize @order_state
    respond_with @order_state
  end

  # DELETE /order_states/1
  def destroy
    @order_state.destroy
    authorize @order_state
    redirect_to order_states_url, notice: 'Order state was successfully destroyed.' if @order_state.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_state
      @order_state = OrderState.find(params[:id])
    end

    def sort_column
      OrderState.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def order_state_params
      params.require(:order_state).permit(:state)
    end
end
