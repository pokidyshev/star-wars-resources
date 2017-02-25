Rails.application.routes.draw do
  devise_for :users

  get 'users/new'
  get 'users/profile', as: 'user_root'

  resources :vehicles, only: [:index, :show]
  resources :starships, only: [:index, :show]
  resources :species, only: [:index, :show]
  resources :planets, only: [:index, :show]
  resources :people, only: [:index, :show]
  resources :films, only: [:index, :show]

  root 'static_pages#index'
end
