# frozen_string_literal: true
Rails.application.routes.draw do
  get 'products/index'
  
  devise_for :users
  root 'products#index'
  resources :products
  resources :users
end