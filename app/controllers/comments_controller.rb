class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show] # for any page except for index and show pages

  # GET /comments
  def index
    @comments = Comment.all
    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment, status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    return render json: { errors: ["Unauthorized"] } if @comment.user != current_user
    @comment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    
    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(
        :body,
        :holiday_id,
        :user_id
      )
    end
end
