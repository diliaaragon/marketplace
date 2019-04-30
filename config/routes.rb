# frozen_string_literal: true
Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'products#index'
  put "/products/:id/publish", to: "products#publish"
  resources :products
  resources :users
end