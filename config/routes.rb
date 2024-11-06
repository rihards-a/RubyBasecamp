# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.htmlRails.application.routes.draw do
Rails.application.routes.draw do
  get "about_renamed", to: "about#index", as: :about # the _path will return this route, even if the url name gets changed == # get "about", to: "about#index"

  # User registration and session management
  get "sign_up", to: "user#new" # get for filling out forms and post for submitting them
  post "sign_up", to: "user#create"
  get "sign_in", to: "sessions#new"
  post "sign_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # Updating a user's password
  get "password", to: "passwords#edit", as: :edit_password
  patch "password", to: "passwords#update"
  # Resetting a user's password via email and globalID token
  get "password/reset", to: "passwords_resets#new"
  post "password/reset", to: "passwords_resets#create"
  get "password/reset/edit", to: "passwords_resets#edit"
  patch "password/reset/edit", to: "passwords_resets#update"

  get "user", to: "user#show" # to implement - display user profile details

  get "/", to: "main#index", as: :root # Same as root to: "" || root ""
end
