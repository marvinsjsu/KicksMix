Rails.application.routes.draw do
  root to: "static_pages#root"
  get "about_us", to: "static_pages#about_us"
  get "editors", to: "static_pages#editors"

  resources :users
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :shoes, only: [:index, :show, :create, :update, :destroy]
  end
end