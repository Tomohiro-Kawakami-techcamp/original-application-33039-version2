Rails.application.routes.draw do
  devise_for :users

  root to: "foods#index"
  resources :foods do
    resources :orders, only: [:index, :create, :show]
  end
  resources :users, only: [:index, :show, :edit, :update]
  resources :addresses, only: [:index]
  resources :comments, only:[:index, :new, :create]
end