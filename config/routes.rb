Rails.application.routes.draw do
  root 'static_pages#index'

  resources :vehicles
  resources :starships
  resources :species
  resources :planets
  resources :people
  resources :films
end
