Rails.application.routes.draw do
  get 'chores/index'

  get 'chores/new'

  get 'chores/create'

  get 'chores/edit'

  get 'chores/update'

  get 'chores/show'

  get 'chores/destroy'

  root 'sessions#index'
  resources :clients, :contractors, :sessions, :requests
  # devise_for :users
end
  
