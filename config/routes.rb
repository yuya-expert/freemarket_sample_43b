Rails.application.routes.draw do
  resources :users do
    member do
      get "address"
      get "payments"
    end
  end

  resources :products
  resources :mypages
  resources :registrations
  root "products#index"
end
