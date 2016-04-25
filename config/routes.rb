Rails.application.routes.draw do
  root 'sessions#index'
  resources :clients, :contractors, :sessions, :requests
  # devise_for :users
end
  
