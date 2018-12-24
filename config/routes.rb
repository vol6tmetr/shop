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

  resources :managers
  resources :customers
  resources :stores

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
