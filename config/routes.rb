Rails.application.routes.draw do


  get 'all_items/all'

  get 'pages/vendor'

  get 'items/index'

  resources :vendors, only: [:index] do
    resources :items
  end

  resources :vendors do
    resources :orders
  end

  resources :line_items
  resources :carts

  resources :orders

  resources :items

  root 'home#index' 

  devise_for :vendors 
end
