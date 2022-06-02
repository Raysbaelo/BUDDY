Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#loading'
  get "graph", to: 'pages#graph'
  # match "user_root" => 'superpowers#landing'

  resources :buddies, only: [:show]
  resources :users, only: [:update, :index]
  resources :tasks do
    resources :occurances
  end

  get :edit_profile, to: 'users#edit_profile'
  patch :update_profile, to: 'users#update_profile'
end
