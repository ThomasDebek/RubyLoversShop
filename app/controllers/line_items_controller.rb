# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :set_cart, only: %i[create update destroy]
  before_action :set_line_item, only: %i[update destroy]
  before_action :find_product, only: %i[create]
  before_action :authenticate_user!

  def create
    line_item =  AddProduct.new.call(product: @product, cart: @cart)
    if line_item.quantity > 5
      flash[:notice]= "your basket may only have five products"
      redirect_to root_path
    else
      line_item.save
      flash[:notice]= "Your cart is update"
      redirect_to @cart
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to @cart, flash: {notice: 'Your cart is update'}
    else
      redirect_to @cart, flash: {error: 'Your input is invalid'}
    end
  end

  def destroy
    DestroyLineItem.new.call(line_item: @line_item)
    redirect_to @cart
  end

  private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
