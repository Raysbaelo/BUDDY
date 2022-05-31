Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
  resources :buddy, only: [:show]
  resources :task do
    resources :occurance
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
