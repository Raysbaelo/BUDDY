Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#loading'
  get "graph", to: 'pages#graph'
  get "calender", to: 'pages#calender'
  # match "user_root" => 'superpowers#landing'

  resources :buddies, only: [:show]
  resources :users, only: [:update, :index]
  resources :tasks do
    resources :occurances
  end
end
