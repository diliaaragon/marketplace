# frozen_string_literal: true
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'products#index'
  put "/products/:id/publish", to: "products#publish"
  put "/products/:id/archive", to: "products#archive"
  resources :products
  resources :users
end