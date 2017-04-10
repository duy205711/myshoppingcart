# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  resources :users
  get 'sessions/new'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :products
  end
  resources :products, only: %i(show index)
  resources :categories
end
