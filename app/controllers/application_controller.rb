# frozen_string_literal: true

class ApplicationController < ActionController::Base
  private

  def set_cart
    if session[:cart_id]
      @cart ||= Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
    end
  end
end
