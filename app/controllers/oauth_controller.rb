class OauthController < ApplicationController
  skip_before_action :authenticate_user!

  def github
    token = HTTParty.post('https://github.com/login/oauth/access_token', {
      query: {
        client_id: ENV["PR4_GITHUB_CLIENT_ID"],
        client_secret: ENV["PR4_GITHUB_CLIENT_SECRET"],
        code: params[:code]
        # redirect_uri: ENV["PR4_FACEBOOK_REDIRECT_URI"] || "http://localhost:7000/"
      },
      headers: { 'Accept' => 'application/json' }
    }).parsed_response

    # p 'token --->', token

    profile = HTTParty.get('https://api.github.com/user', {
      query: token,
      headers: { 'User-Agent' => 'HTTParty', 'Accept' => 'application/json' }
    }).parsed_response

    # p 'profile --->', profile

    user = User.where("email = :email OR github_id = :github_id", email: profile["email"], github_id: profile["id"]).first
    user = User.new username: profile["login"], email: profile["email"], airport: "LHR" unless user
    # p 'user --->', user

    user[:github_id] = profile["id"]
    user[:email] = profile["email"]
    # user[:image] = profile["avatar_url"]


    if user.save
      token = Auth.issue({ id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def facebook
    token = HTTParty.get('https://graph.facebook.com/v5.0/oauth/access_token', {
      query: {
        client_id: ENV["PR4_FACEBOOK_CLIENT_ID"],
        client_secret: ENV["PR4_FACEBOOK_CLIENT_SECRET"],
        redirect_uri: ENV["PR4_FACEBOOK_REDIRECT_URI"],
        code: params[:code]
      },
      headers: { 'Accept' => 'application/json' }
    }).parsed_response

    profile = HTTParty.get('https://graph.facebook.com/v5.0/me?fields=id,name,email', { # add ,picture.height(961) to query profile_pic
      query: token,
      headers: { 'User-Agent' => 'HTTParty', 'Accept' => 'application/json' }
    }).parsed_response

    user = User.where("email = :email OR facebook_id = :facebook_id", email: profile["email"], facebook_id: profile["id"]).first
    user = User.new username: profile["name"], email: profile["email"], airport: "LHR" unless user
    # image: profile["picture"]["data"]["url"]

    user[:facebook_id] = profile["id"]
    user[:email] = profile["email"]
    # user[:image] = profile["picture"]["data"]["url"]

    if user.save
      token = Auth.issue({ id: user.id })
      render json: { user: UserSerializer.new(user), token: token }, status: :ok
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end
end
