Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      get 'user', to: 'users#show'
      post 'user', to: 'users#create'
    end
  end
end
