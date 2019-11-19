class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users
  end

  # GET /users/1
  def show
    # @user = User.find_by!(id: params[:id])
    # @user = User.find(params[:id])
    # raise Error::NotVisibleError unless @user.is_visible?
    if @user
      render json: @user, status: :ok
    else
      # render json: { error: ["User with id #{params[:id]} not found."] }
      render json: { error: "User with id #{params[:id]} not found." }
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(Uploader.upload(user_params))
      render json: @user, status: :ok, location: @user
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
        :airport,
        :password,
        :password_confirmation
      )
    end
end
