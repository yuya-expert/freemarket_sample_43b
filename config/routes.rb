Rails.application.routes.draw do
  get "mypages/payment"=> "mypages#payments"
  resources :products
  resources :mypages do
    collection do
      get "payments"
    end
  end
  resources :registrations
  root "products#index"
end
