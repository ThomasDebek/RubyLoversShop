# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    @cart = Cart.find(params[:id])
    if @cart.destroy
      session[:cart_id] = nil
      redirect_to root_path, notice: 'Your shopping cart has just been emptied'
    else
      flash[:notice] = 'Something is wrong. Please try again'
    end
  end
end
