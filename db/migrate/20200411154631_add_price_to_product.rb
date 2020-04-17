# frozen_string_literal: true

class AddPriceToProduct < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :price, :decimal, precision: 8, scale: 2
  end
end
