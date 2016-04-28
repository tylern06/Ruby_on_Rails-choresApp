Rails.application.routes.draw do
  root 'sessions#index'

  resources :clients, :contractors, :sessions, :requests, :chores
  post 'requests/:id' => 'requests#create'
  # devise_for :users
end
  

