Rails.application.routes.draw do

  root "sessions#new"
  resource :session, only: [:new, :create, :destroy]
  resources :users
  resources :foods
end
