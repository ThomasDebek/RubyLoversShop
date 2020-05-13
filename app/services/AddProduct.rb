# frozen_string_literal: true

class AddProduct
  def call(product:, cart:)
    line_item = cart.add_product(product)
    line_item
  end
end
