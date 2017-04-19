# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'session_customers#new'
  post '/login', to: 'session_customers#create'
  delete '/logout', to: 'session_customers#destroy'

  resources :users
  resources :carts
  resources :session_customers, only: %i(new create destroy)
  resources :customers
  namespace :admin do
    resources :products
  end
  resources :orders
  resources :products, only: %i(show index)
  resources :categories
end
