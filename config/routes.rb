Rails.application.routes.draw do
  scope :api do
    resources :users, except: [:create]
    resources :groups do
      resources :holidays do
        resources :comments
      end
    end
    get 'flights', to: 'skyscanner#flights'
    # put 'holidays', to: 'holidays#update'
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github', to: 'oauth#github'
    post 'oauth/facebook', to: 'oauth#facebook'
  end
end
