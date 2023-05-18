Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users
  resources :certifications
  resources :import

  get "latest5/:id", to: "certifications#latest5" 
  post 'upload', to: 'import#upload'

  resources :user_certifications
end
