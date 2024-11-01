# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.htmlRails.application.routes.draw do
Rails.application.routes.draw do
  # User registration and session management
  get "sign_up", to: "user#new"
  post "sign_up", to: "user#create"

  get "sign_in", to: "sessions#new" # get for filling out forms and post for submitting them
  post "sign_in", to: "sessions#create"

  delete "logout", to: "sessions#destroy"


  get "user", to: "user#show" # to implement - display user profile details

  get "about_renamed", to: "about#index", as: :about # the _path will return this route, even if the url name gets changed == # get "about", to: "about#index"

  get "/", to: "main#index", as: :root # Same as root to: "" || root ""
end
