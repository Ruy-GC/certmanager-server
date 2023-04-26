Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :certifications

  get "latest5/:id", to: "certifications#latest5" 

  resources :user_certifications

end