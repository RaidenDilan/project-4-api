class CommentsController < ApplicationController
  before_action :set_comment, only: [:destroy]

  # POST /comments
  def create
    # @comment = @holiday.comment.new(comment_params)
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment, status: :created, location: @comment
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
      params.require(:comment).permit(:body, :holiday_id, :user_id)
    end
end
