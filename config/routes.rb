Rails.application.routes.draw do
  scope "(:locale)", locale: /ja|vi/ do
    root "static_pages#home"

    resources :requests, except: %i(show edit destroy)
    resources :schedules, except: %i(new create destroy)
    resources :notifications, only: %i(index destroy)

    devise_for :users

    resources :users, only: %i(show edit update)
    resources :pilots, only: :index
  end

  mount Base => '/'
end
