Rails.application.routes.draw do

  devise_for :managers, path: 'managers', controllers: {
    sessions: 'manager/sessions',
    registrations: 'manager/registrations'
  }

  devise_for :customers, path: 'customers', controllers: {
    sessions: 'customers/sessions',
    registrations: 'customers/registrations'
  }

  devise_for :stores, path: 'stores', controllers: {
    sessions: 'stores/sessions',
    registrations: 'stores/registrations'
  }

  resources :managers, only: [:index, :show, :edit, :update, :destroy]
  resources :stores, only: [:index, :show]
  resources :products

  post 'duplicate', to: 'products#duplicate', as: :product_duplicate

  post '/cart', to: 'shopping_cart_item#create'
  get '/shopping_cart', to: 'shopping_cart#index'

  post '/checkout', to: 'order#create'

  get '/orders', to: 'order#index'

  put '/order_status', to: 'order#status'

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
