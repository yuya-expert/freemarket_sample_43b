Rails.application.routes.draw do
  resources :users, only: [:edit] do
    member do
      get "payments"
    end
  end

  resources :mypages, only: [:index, :edit, :destroy]
  resources :products, only: [:index, :new]
  resources :registrations, only: [:index, :new]
  root "products#index"
end
