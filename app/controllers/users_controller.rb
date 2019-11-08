class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  # skip_before_action :authenticate_user!, only: [:index, :show, :destroy] # for any page except for index and show pages

  # GET /users
  def index
    @users = User.all
    render json: @users
    # render json: @users, include: ['groups_created.comments', 'groups_created.comments.user', 'groups_attending.comments.user', 'groups_attending.comments']
  end

  # GET /users/1
  def show
    render json: @user
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(Uploader.upload(user_params))
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(
        :username,
        :email,
        :base64,
        :bio,
        :airport,
        :password,
        :password_confirmation,
        groups_attending_ids:[]
      )
    end
end
