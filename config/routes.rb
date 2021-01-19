Rails.application.routes.draw do
  root 'home#index'
  #get 'admin/index'
  get 'signup', to: "users#new"
  resource :user, only: [:create, :show]

  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  # get 'posts', to: 'posts#index'
  # get 'posts/:id', to: 'posts#show'
  # get '/admin/posts/new', to:'posts#new'
  # post '/admin/posts/new', to:'posts#create'
  resources :posts

end
