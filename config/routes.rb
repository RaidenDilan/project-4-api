Rails.application.routes.draw do

  scope :api do
    resources :groups
    resources :comments
    resources :posts
    resources :holidays
    resources :users, except: [:create]

    get 'flights', to: 'skyscanner#flights'
    post 'register', to: 'authentications#register'
    post 'login', to: 'authentications#login'
    post 'oauth/github', to: 'oauth#github'
  end
end
