Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'login', to: 'auth#login'

      # contract routes
      resources :contracts, only: [:create, :show]
      get 'my_contracts', to: 'contracts#my_contracts'
      get 'contracts_list', to: 'contracts#list'
      post 'subscribe', to: 'contracts#subscribe'
      post 'unsubscribe', to: 'contracts#unsubscribe'

      # user routes
      resources :users, only:  [:create]
      get 'my_account', to: 'users#my_account'
      get 'users', to: 'users#show'
      get 'users_list', to: 'users#list'
      delete 'users', to: 'users#destroy'

      # option routes
      get 'option', to: 'options#list'
    end
  end
end
