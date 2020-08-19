class AuthenticationsController < ApplicationController
  # before_validation :downcase_email
  # skip_before_action :authenticate_user!

  def register
    # if user
    # p 'user_params -=-===-=-=-=-=', user_params
    # user = User.new(user_params)
    user = User.new(Uploader.upload(user_params))
    # @group = Group.find 1 # set group to first group by index
    @group = null;
    # @group.users << current_user #

    # p '--------------------------------------> REGISTER', user

    if user.save
      render json: user, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def login
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      token = Auth.issue({ id: user.id })
      render json: { token: token, user: UserSerializer.new(user) }, status: :ok
    else
      render json: { errors: ["Invalid login credentials."] }, status: 401
    end
  end

  private
    # def downcase_email
    #   self.email = email.downcase if email.present?
    # end

    def user_params
      params.permit(
        :username,
        :email,
        :airport,
        :base64,
        :password,
        :password_confirmation,
      )
    end
end
