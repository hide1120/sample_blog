Rails.application.routes.draw do
  get 'admin/index'
  root 'home#index'
  get 'signup' => "users#new"
  resource :user, only: [:create, :show]

  get 'login' => "sessions#new"
  post 'login' => "sessions#create"
  delete 'logout' => "sessions#destroy"

end
