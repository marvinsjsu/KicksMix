Rails.application.routes.draw do
  root to: "static_pages#root"
  get "about_us", to: "static_pages#about_us"
  get "editors", to: "static_pages#editors"

  resources :users, :has_many => :comments
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do

    resources :users, :has_many => :comments, only: [:show, :create, :update] do
      resources :comments, only: [:create, :destroy, :update], :has_many => :comments
    end

    resources :shoes, only: [:index, :show, :create, :update, :destroy], :has_many => :comments do
      resources :comments, only: [:create, :destroy, :update], :has_many => :comments
    end

    resources :comments do
       resources :comments, only: [:create], :has_many => :comments
    end
  end
end