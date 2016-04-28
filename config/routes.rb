Rails.application.routes.draw do
  root 'sessions#index'
  resources :clients, :contractors, :sessions, :requests, :chores

  get 'chores_client/:id' => 'chores#show_client'
  patch 'chores/:id/update' => 'chores#update_client'
  # devise_for :users
end
  

