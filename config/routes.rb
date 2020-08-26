Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"
    get "users/new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"

    resources :requests, only: %i(new create)
    resources :schedules, except: %i(new create destroy)
    resources :notifications, only: %i(index destroy)
    resources :users, only: :show
  end
end
