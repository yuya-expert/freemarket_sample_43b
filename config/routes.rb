Rails.application.routes.draw do
  get "mypages/payment"=> "mypages#payments"
  resources :products
  resources :mypages
  root "products#index"
end
