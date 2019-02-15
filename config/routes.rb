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
  resources :products, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :images, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    member do
      get "confirmation"
      get "detail"
      post "completion"
    end
    collection do
      post "search_category"
    end
  end
  resources :registrations, only: [:index, :new]
  resources :brands, only: [:show]
  root "products#index"
end
