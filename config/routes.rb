Rails.application.routes.draw do
  resources :vehicles
  resources :starships
  resources :species
  resources :planets
  resources :people
  resources :films
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
