Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"
    get "users/new"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    resources :password_changes
    resources :users, only: :show
    resources :password_resets, except: %i(index show destroy)
  end
end
