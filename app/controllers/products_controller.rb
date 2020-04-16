# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :find_product, only: [:show]

  def index
    @products = Product.paginate(page: params[:page], per_page: 6)
  end

  def show; end

  private

  def find_product
    @product = Product.find(params[:id])
  end
end
