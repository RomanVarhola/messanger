Rails.application.routes.draw do
  
  resources :conversations, only: [:show]
  resources :messages, only: [:create, :new, :destroy]
  resources :homes, only: [:index]
  devise_for :users
  resources :users
  root to: 'homes#index'
end
