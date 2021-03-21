Rails.application.routes.draw do
  root 'home#index'
  get 'signup', to: "users#new"
  resource :user, only: [:create, :show, :edit, :update]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :posts
  resources :uploads, only: [:create, :destroy]

  resources :banners, except: [:show]
end
