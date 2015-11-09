Rails.application.routes.draw do

  get 'items/index'

  resources :items

  root 'home#index'

  devise_for :vendors
end
