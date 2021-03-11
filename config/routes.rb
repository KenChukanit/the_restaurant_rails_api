Rails.application.routes.draw do

 
  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :orders
  resources :foods do
    resource :reviews, only: [:new, :create, :destroy]
  end
  

  namespace :api, defaults: {format: :json} do # we can set default response format of the block
    namespace :v1 do
      resources :foods, only:[:index, :show]  do
        resources :reviews, only: [:create, :destroy]
        resources :favourites, shallow: :true, only: [ :create, :destroy]
      end
      resources :favourites, only: [:index]
      resources :payments, only: [:index, :create]
      resource :session, only: [:create, :destroy]
      get('/current_user', to: 'sessions#get_current_user')
      resources :users, only:[:create]
      resources :orders
      get('/order_user', to: 'orders#order_user')
      match "*unmatched_route", to: "application#not_found", via: :all
    end
 
  end
  
end
