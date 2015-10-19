class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  # GET /roles
  def index
    @roles = Role.all.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:per_page])
    respond_with @roles
  end

  # GET /roles/1
  def show
    respond_with @role
  end

  # GET /roles/new
  def new
    @role = Role.new
    respond_with @role
  end

  # GET /roles/1/edit
  def edit
  end

  # POST /roles
  def create
    @role = Role.new(role_params)
    @role.save
    flash[:notice] =  'The role was successfully saved!' if @role.save && !request.xhr?
    respond_with @role
  end

  # PATCH/PUT /roles/1
  def update
    @role.update(role_params)
    flash[:notice] =  'The role was successfully updated!' if @role.update(role_params) && !request.xhr?
    respond_with @role
  end

  # DELETE /roles/1
  def destroy
    @role.destroy
    redirect_to roles_url, notice: 'Role was successfully destroyed.'
    respond_with @role
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_role
      @role = Role.find(params[:id])
    end

    def sort_column
      Role.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
    # Only allow a trusted parameter "white list" through.
    def role_params
      params.require(:role).permit(:name)
    end
end
