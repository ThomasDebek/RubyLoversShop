# frozen_string_literal: true

Rails.application.routes.draw do
  get 'carts/show'
  resources :products, only: %i[index show] do
    collection do
      get 'search'
    end
  end
  root 'products#index'
end
