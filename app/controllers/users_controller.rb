class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show, :destroy]

  # GET /users
  def index
    @users = User.all

    # render json: @users
    render json: @users, include: ['groups_attending.comments', 'groups_created.comments', 'groups_attending.comments.user', 'groups_created.comments.user']
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(Uploader.upload(user_params))

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
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
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password, :image, :airport, :bio, :base64, :groups_created, groups_attending_ids: [])
    end
end
