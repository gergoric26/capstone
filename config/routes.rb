Rails.application.routes.draw do


  resources :line_items
  resources :carts
  get 'all_items/all'

  get 'pages/vendor'

  get 'items/index'

  resources :vendors, only: [:index] do
    resources :items
  end

  resources :items

  root 'home#index' 

  devise_for :vendors 
end
