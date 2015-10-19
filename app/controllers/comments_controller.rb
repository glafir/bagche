class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.all.order(sort_column + " " + sort_direction).page(params[:page]).per(params[:limit])
    authorize Comment.all
    respond_with @comments
  end

  # GET /comments/1
  def show
    authorize @comment
    respond_with @comment
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    authorize @comment
    respond_with @comment
  end

  # GET /comments/1/edit
  def edit
    authorize @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    flash[:notice] =  'The comment was successfully saved!' if @comment.save && !request.xhr?
    authorize @comment
    respond_with @comment
  end

  # PATCH/PUT /comments/1
  def update
    @comment.update(comment_params)
    flash[:notice] =  'The comment was successfully updated!' if @comment.update(comment_params) && !request.xhr?
    authorize @comment
    respond_with @comment
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    authorize @comment
    redirect_to comments_url, notice: 'Comment was successfully destroyed.' if @comment.destroy && !request.xhr?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def sort_column
      Comment.all.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end


    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:comment, :user_id, :order_id, :product_id)
    end
end
