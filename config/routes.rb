Rails.application.routes.draw do
  resources :maintenance_material_lists
  resources :maintenances
  resources :motors
  resources :materials
  resources :cities
  devise_for :users
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
