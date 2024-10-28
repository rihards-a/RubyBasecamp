# Define your application routes per the DSL in https://guides.rubyonrails.org/routing.htmlRails.application.routes.draw do
Rails.application.routes.draw do
  get "sign_up" => "user/new"

  # GoRails tutorial
  # get "about", to: "about#index"
  get "about_renamed", to: "about#index", as: :about # the _path will return this route, even if the url name gets changed

  get "/", to: "main#index", as: :root
  # Same as root to: "" || root ""

  #get ""
end
