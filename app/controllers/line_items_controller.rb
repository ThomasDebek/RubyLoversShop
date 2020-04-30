# frozen_string_literal: true

class LineItemsController < ApplicationController
  before_action :set_cart, only: %i[create update]

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)
    if  current_quantity
      redirect_to root_path, notice: 'Your basket may contain only five same products '
    else
      @line_item.save
      redirect_to @cart
    end
  end

  def update
    @line_item = LineItem.find(params[:id])
    if @line_item.update(line_item_params)
      redirect_to @cart
    else
      redirect_to @cart, flash: { error: 'Your input is invalid' }
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @cart = @line_item.cart
    if amount_elements
      @line_item.save
    else
      @line_item.destroy
    end
    redirect_to @cart
  end

  private

  def current_quantity
    current_item = @line_item.quantity
    if current_item > 5
      true
    end
  end

  def amount_elements
    if @line_item.quantity > 1
      @line_item.quantity -= 1
      true
    end
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id )
  end
end
