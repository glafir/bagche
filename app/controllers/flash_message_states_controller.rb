class FlashMessageStatesController < ApplicationController
  before_action :set_flash_message_state, only: [:show, :edit, :update, :destroy]

  # GET /flash_message_states
  def index
    @flash_message_states = FlashMessageState.all.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize FlashMessageState.all
    respond_with @flash_message_states
  end

  # GET /flash_message_states/1
  def show
    authorize @flash_message_state
    respond_with @flash_message_state
  end

  # GET /flash_message_states/new
  def new
    @flash_message_state = FlashMessageState.new
    authorize @flash_message_state
    respond_with @flash_message_state
  end

  # GET /flash_message_states/1/edit
  def edit
    authorize @flash_message_state
  end

  # POST /flash_message_states
  def create
    @flash_message_state = FlashMessageState.new(flash_message_state_params)
    @flash_message_state.save
    flash[:notice] =  'The flash_message_state was successfully saved!' if @flash_message_state.save && !request.xhr?
    authorize @flash_message_state
    respond_with @flash_message_state
  end

  # PATCH/PUT /flash_message_states/1
  def update
    @flash_message_state.update(flash_message_state_params)
    flash[:notice] =  'The flash_message_state was successfully updated!' if @flash_message_state.update(flash_message_state_params) && !request.xhr?
    authorize @flash_message_state
    respond_with @flash_message_state
  end

  # DELETE /flash_message_states/1
  def destroy
    @flash_message_state.destroy
    authorize @flash_message_state
    redirect_to flash_message_states_url, notice: 'Flash message state was successfully destroyed.' if @flash_message_state.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flash_message_state
      @flash_message_state = FlashMessageState.find(params[:id])
    end

    def sort_column
      FlashMessageState.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def flash_message_state_params
      params.require(:flash_message_state).permit(:state)
    end
end
