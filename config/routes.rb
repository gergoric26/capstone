Rails.application.routes.draw do


  devise_for :users
  get 'your_orders/all_orders'
  #passing your_order id and (as:) adding name
  get 'your_orders/:id', controller: 'your_orders', action: 'order', as: 'your_order'

  get 'all_items/all'

  get 'pages/vendor'

  get 'items/index'

  resources :vendors, only: [:index] do
    resources :items
    resources :orders
  end

  resources :users do
    resources :orders
  end


  resources :line_items
  resources :carts

  resources :orders

  resources :items

  root 'home#index' 

  devise_for :vendors 
end
