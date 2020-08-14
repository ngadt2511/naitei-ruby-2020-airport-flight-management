Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"
    get "users/new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    resources :users, only: :show
  end
end
