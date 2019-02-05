Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit] do
    member do
      get "payments"
    end
  end

  resources :mypages, only: [:index, :edit, :destroy]
  resources :products, only: [:new, :create, :edit] do
    member do
      get "confirmation"
    end
    collection do
      post "search_category"
    end
  end
  resources :registrations, only: [:index, :new]
  resources :brands, only: [:show]
  root "products#index"
end
