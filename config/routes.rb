Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'
      get 'user', to: 'users#show'
      post 'user', to: 'users#create'
      # user routes
      resources :users, only:  [:create, :destroy]
      get 'users', to: 'users#my_account'
      get 'users/:email', to: 'users#show'
      get 'users_list', to: 'users#list'

      # option routes
      get 'option', to: 'options#list'
    end
  end
end
