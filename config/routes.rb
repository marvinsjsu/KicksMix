Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :shoes, only: [:index, :show, :create, :update, :destroy]
  end
end