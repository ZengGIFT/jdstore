Rails.application.routes.draw do
  devise_for :users

  resources :cart

  resources :products do
    member do
      post :addToCart
    end
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
