Rails.application.routes.draw do
  root "books#index"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
end
