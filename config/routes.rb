Rails.application.routes.draw do

 
  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :orders, only:[:new, :index, :create, :show, :update]
  resources :foods do
    resource :reviews, only: [:new, :create, :destroy]
  end
  

  namespace :api, defaults: {format: :json} do # we can set default response format of the block
    namespace :v1 do
      resources :foods, only:[:index, :show]  do
        resource :reviews, only: [:create, :destroy]
      end
      resource :session, only: [:create, :destroy]
      get('/current_user', to: 'sessions#get_current_user')
      resources :users, only:[:create]
      resources :orders, only:[:index, :create, :show, :update]
      get('/order_user', to: 'orders#order_user')
     
    end
 
  end
  
end
