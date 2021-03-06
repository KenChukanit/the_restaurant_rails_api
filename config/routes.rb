Rails.application.routes.draw do

 
  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :orders
  resources :foods do
    resource :reviews, only: [:new, :create, :destroy]
  end
  resources :charges
  scope '/checkout' do
    post 'create', to: 'checkout#create', as:   'checkout_create'
    get 'cancel', to: 'checkout#cancel',  as: 'checkout_cancel'
    get 'success', to: 'checkout#success',  as: 'checkout_success'
 
  end

  namespace :api, defaults: {format: :json} do # we can set default response format of the block
    namespace :v1 do
      resources :foods, only:[:index, :show]  do
        resources :reviews, only: [:create, :destroy]
      end
      resource :session, only: [:create, :destroy]
      get('/current_user', to: 'sessions#get_current_user')
      resources :users, only:[:create]
      resources :orders
      get('/order_user', to: 'orders#order_user')
     
    end
 
  end
  
end
