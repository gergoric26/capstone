Rails.application.routes.draw do

  get 'items/index'

  get 'items/show'

  get 'items/new'

  get 'items/edit'

  root 'home#index'

  devise_for :vendors
end
