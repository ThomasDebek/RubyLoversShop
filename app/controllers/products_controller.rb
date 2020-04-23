# frozen_string_literal: true

class ProductsController < ApplicationController

  before_action :set_cart

  before_action :find_product, only: [:show]

  def index
    @products = Product.paginate(page: params[:page], per_page: 6)
  end

  def show
    unless line_items.empty?
      @product.errors.add(:base, 'Line Items present')
      throw :abort
    end
  end

  def search
    @products = SearchProduct.new.call(params[:q]).paginate(page: params[:page], per_page: 6)
    if @products.empty?
      flash[:notice] = 'There is no product you are looking for, please try again '
      redirect_back(fallback_location: products_path) unless @products.any?
    end
  end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
