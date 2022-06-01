Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#loading'
  resources :buddies, only: [:show]
  resources :users, only: [:update, :index]
  resources :tasks do
    resources :occurances
  end
end
