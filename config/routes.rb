Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:edit, :create] do
    member do
      get "payments"
    end
    collection do
      get "main_data"
      post "sms_confirmation"
    end
  end

  resources :mypages, only: [:index, :edit, :destroy]

  resources :products, only: [:new, :edit,:show, :destroy] do
    resources :likes, only: [:create, :destroy]
    member do
      get "confirmation"
      get "detail"

    end
  end
  resources :registrations, only: [:index, :new]
  root "products#index"
end
