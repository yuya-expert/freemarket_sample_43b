Rails.application.routes.draw do
  resources :products
  resources :mypages
  root "products#index"
end
