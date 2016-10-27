Rails.application.routes.draw do
  devise_for :users

  resources :products

  namespace :admin do
    resources :products
    resources :users do
      member do
        post :setUserAdmin
        post :setUserCustomer
      end
    end
  end
  root "products#index"
end
