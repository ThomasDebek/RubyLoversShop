# frozen_string_literal: true

Rails.application.routes.draw do
  resources :homes
  devise_for :users
  resources :line_items
  resources :carts, only: %i[show create destroy]
  resources :products, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  root 'products#index'
end
