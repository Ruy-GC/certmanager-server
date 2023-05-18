Rails.application.routes.draw do
  resources :imports
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :employees
  
  resources :certifications
  get "latest5/:id", to: "certifications#latest5" 

  resources :employee_certifications

  resources :users
  post "/auth/login", to: "authentication#login"

end