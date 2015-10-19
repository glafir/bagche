<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_controller"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationController
  before_action :set_<%= singular_table_name %>, only: [:show, :edit, :update, :destroy]

  # GET <%= route_url %>
  def index
    @<%= plural_table_name %> = <%= orm_class.all(class_name) %>.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize = @<%= plural_table_name %>
    respond_with @<%= plural_table_name %>
  end

  # GET <%= route_url %>/1
  def show
    authorize @<%= singular_table_name %>
    respond_with @<%= singular_table_name %>
  end

  # GET <%= route_url %>/new
  def new
    @<%= singular_table_name %> = <%= orm_class.build(class_name) %>
    authorize @<%= singular_table_name %>
    respond_with @<%= singular_table_name %>
  end

  # GET <%= route_url %>/1/edit
  def edit
    authorize @<%= singular_table_name %>
  end

  # POST <%= route_url %>
  def create
    @<%= singular_table_name %> = <%= orm_class.build(class_name, "#{singular_table_name}_params") %>
    authorize @<%= singular_table_name %>
    @<%= orm_instance.save %>
    flash[:notice] =  'The <%= singular_table_name %> was successfully saved!' if @<%= orm_instance.save %> && !request.xhr?
    respond_with @<%= singular_table_name %>
  end

  # PATCH/PUT <%= route_url %>/1
  def update
    @<%= orm_instance.update("#{singular_table_name}_params") %>
    authorize @<%= singular_table_name %>
    flash[:notice] =  'The <%= singular_table_name %> was successfully updated!' if @<%= orm_instance.update("#{singular_table_name}_params") %> && !request.xhr?
    respond_with @<%= singular_table_name %>
  end

  # DELETE <%= route_url %>/1
  def destroy
    authorize @<%= singular_table_name %>
    @<%= orm_instance.destroy %>
    redirect_to <%= index_helper %>_url, notice: <%= "'#{human_name} was successfully destroyed.'" %>  if @<%= orm_instance.destroy %> && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_<%= singular_table_name %>
      @<%= singular_table_name %> = <%= orm_class.find(class_name, "params[:id]") %>
    end

    def sort_column
      <%= orm_class.all(class_name) %>.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def <%= "#{singular_table_name}_params" %>
      <%- if attributes_names.empty? -%>
      params[:<%= singular_table_name %>]
      <%- else -%>
      params.require(:<%= singular_table_name %>).permit(<%= attributes_names.map { |name| ":#{name}" }.join(', ') %>)
      <%- end -%>
    end
end
<% end -%>
