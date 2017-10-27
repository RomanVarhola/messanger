Rails.application.routes.draw do

  resources :conversations do
    member do
      post 'read'
    end
  end
  resources :messages, only: [:create, :new, :destroy] do
    member do
      get 'reply'
    end
  end
  resources :blockings, only: [:create, :index, :destroy]
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
