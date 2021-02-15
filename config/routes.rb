Rails.application.routes.draw do

  root "session#new"
  resource :session, only: [:new, :create, :destroy]

end
