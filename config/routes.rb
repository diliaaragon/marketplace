# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :users
  get 'users/index'
  root 'users#index'
  resources :products
  resources :users
end