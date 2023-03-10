Rails.application.routes.draw do
  devise_for :users # Routes for authentication
  resources :appointments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # root "splashes#index" # Defines the root path route ("/")

  # Defines the root path route ("/")
  root "appointments#index"
end
