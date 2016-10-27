Rails.application.routes.draw do
  devise_for :users

  resources :products

  namespace :admin do
    resources :products
    resources :users
  end
  root "products#index"
end
