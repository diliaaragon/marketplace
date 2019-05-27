# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  get 'welcome/index'
  root 'welcome#index'
  put "/products/:id/publish", to: "products#publish"
  put "/products/:id/archive", to: "products#archive"
  resources :products
  resources :categories
  resources :users, only: [:show]
end