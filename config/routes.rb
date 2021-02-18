Rails.application.routes.draw do

  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :foods do
    resource :reviews, only: [:new, :create, :destroy]
  end
end
