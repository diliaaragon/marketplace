# frozen_string_literal: true.
Rails.application.routes.draw do
  root 'users#index'
  resources :products
  resources :users
end
