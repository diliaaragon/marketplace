# frozen_string_literal: true.
Rails.application.routes.draw do
  root 'users#index'
  resources :products
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
end
