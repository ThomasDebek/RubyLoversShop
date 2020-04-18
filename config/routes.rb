# frozen_string_literal: true

Rails.application.routes.draw do
  resources :line_items
  resources :carts
  resources :products, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  root 'products#index'
end
