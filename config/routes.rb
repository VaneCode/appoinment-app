Rails.application.routes.draw do
  devise_for :users
  resources :appointments
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  authenticated :user do
    root to: "home#dashboard", as: :authenticated_root
  end

  # Defines the root path route ("/")
  root to: "home#index"
end
