Rails.application.routes.draw do

  get 'pages/vendor'

  get 'items/index'

  resources :items

  root 'home#index'

  devise_for :vendors
end
