Rails.application.routes.draw do

  resources :conversations, only: [:show]
  resources :messages, only: [:create, :new, :destroy] do
    member do
      get 'reply'
    end
  end
  resources :homes, only: [:index]
  devise_for :users
  resources :users do
    member do
      post 'block'
      post 'unblock'
    end
  end
  root to: 'homes#index'
end
