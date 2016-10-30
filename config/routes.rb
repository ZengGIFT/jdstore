Rails.application.routes.draw do
  devise_for :users

  resources :products do
    resources :tests
  end

  namespace :admin do
    resources :products do
      member do
        post :publishProduct
        post :hideProduct
      end
    end
    resources :orders
    resources :users do
      member do
        post :setUserAdmin
        post :setUserCustomer
      end
    end
  end
  root "products#index"
end
