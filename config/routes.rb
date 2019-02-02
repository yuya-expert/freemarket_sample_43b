Rails.application.routes.draw do
  get "mypages/payment"=> "mypages#payments"
  get "mypages/profile"=> "mypages#profile"
  resources :products
  resources :mypages do
    collection do
      get "payments"
    end
  end
  resources :registrations
  root "products#index"
end
