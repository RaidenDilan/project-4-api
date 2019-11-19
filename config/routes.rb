Rails.application.routes.draw do

  scope :api do
    get 'flights', to: 'skyscanner#flights'

    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'

    post 'oauth/github', to: 'oauth#github'
    post 'oauth/facebook', to: 'oauth#facebook'

    resources :memberships, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :users, except: [:create]

    resources :groups do
      resources :holidays do
      end
    end

  end
end
