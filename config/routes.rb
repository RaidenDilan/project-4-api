Rails.application.routes.draw do

  scope :api do
    resources :memberships, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :users, except: [:create]
    resources :groups do
      resources :holidays do
      end
    end

    get 'flights', to: 'skyscanner#flights'
    # get 'weather', to: 'openweather#forecast'

    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github', to: 'oauth#github'
    post 'oauth/facebook', to: 'oauth#facebook'
  end
end
