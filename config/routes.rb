Rails.application.routes.draw do
  resources :maintenance_material_lists
  resources :maintenances
  resources :motors
  resources :materials
  resources :cities
  devise_for :users
  get 'home/index'
  get 'home/terms'
  root "home#index"
end
