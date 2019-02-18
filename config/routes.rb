Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks'
  }
  resources :users, only: [:new, :edit, :create] do
    member do
      get "payments"
    end
    collection do
      get "main_data"
      post "sms_confirmation"
    end
  end

  resources :mypages, only: [:index, :edit, :update, :destroy]
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
