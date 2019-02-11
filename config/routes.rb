Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit] do
    member do
      get "payments"
    end
  end

  resources :mypages, only: [:index, :edit, :destroy]
  resources :products, only: [:new, :show] do
    resources :likes, only: [:create, :destroy]
    member do
      get "confirmation"
    end
  end
  resources :registrations, only: [:index, :new]
  root "products#index"
end
