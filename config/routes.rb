Rails.application.routes.draw do


  get 'all_items/all'

  get 'pages/vendor'

  get 'items/index'

  resources :vendors, only: [:index] do
    resources :items
  end

  resources :items

  resources :order_items

  resources :carts

  root 'home#index' 

  devise_for :vendors 
end
