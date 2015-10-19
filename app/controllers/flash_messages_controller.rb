class FlashMessagesController < ApplicationController
  before_action :set_flash_message, only: [:show, :edit, :update, :destroy]

  # GET /flash_messages
  def index
    @flash_messages = FlashMessage.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize FlashMessage
    respond_with @flash_messages
  end

  # GET /flash_messages/1
  def show
    authorize @flash_message
    respond_with @flash_message
  end

  # GET /flash_messages/new
  def new
    @flash_message = FlashMessage.new
    authorize @flash_message
    respond_with @flash_message
  end

  # GET /flash_messages/1/edit
  def edit
    authorize @flash_message
  end

  # POST /flash_messages
  def create
    @flash_message = FlashMessage.new(flash_message_params)
    @flash_message.save
    flash[:notice] =  'The flash_message was successfully saved!' if @flash_message.save && !request.xhr?
    authorize @flash_message
    respond_with @flash_message
  end

  # PATCH/PUT /flash_messages/1
  def update
    @flash_message.update(flash_message_params)
    flash[:notice] =  'The flash_message was successfully updated!' if @flash_message.update(flash_message_params) && !request.xhr?
    authorize @flash_message
    respond_with @flash_message
  end

  # DELETE /flash_messages/1
  def destroy
    @flash_message.destroy
    authorize @flash_message
    redirect_to flash_messages_url, notice: 'Flash message was successfully destroyed.' if @flash_message.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flash_message
      @flash_message = FlashMessage.find(params[:id])
    end

    def sort_column
      FlashMessage.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def flash_message_params
      params.require(:flash_message).permit(:user_id, :message, :request_url, :request_ip, :request_method, :request_referrer, :useragent)
    end
end
