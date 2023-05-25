Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :employees
  resources :certifications
  resources :import
  resources :user_certifications
  resources :employee_certifications
  resources :users
  
  get "latest5/:id", to: "employee_certifications#latest5" 
  post 'upload', to: 'import#upload'
  post "/auth/login", to: "authentication#login"
  get "related3/:id", to: "related#related3" 
  get "empCert", to: "employee_certifications#empCert" 
  get "amntmonth/:id", to: "employee_certifications#amountPerMonth" 
end