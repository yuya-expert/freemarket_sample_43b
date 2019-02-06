Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit] do
    member do
      get "payments"
    end
  end

  resources :mypages, only: [:index, :edit, :destroy]

<<<<<<< HEAD
  resources :products, only: [:new, :edit,:show, :destroy] do
=======
  resources :products, only: [:new, :edit] do
>>>>>>> wonder-boooy/master
    member do
      get "confirmation"
    end
  end

  resources :registrations, only: [:index, :new]
  root "products#index"
end
