Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:edit, :update, :index]
  resource :home, only: [:index]
  resources :friendships, only: [:create, :update, :destroy, :show]

  devise_for :users
end
