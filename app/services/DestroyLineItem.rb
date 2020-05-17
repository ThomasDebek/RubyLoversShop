# frozen_string_literal: true

class DestroyLineItem
  def call(line_item:)
    if line_item.quantity > 1
      line_item.quantity -= 1
      line_item.save
    else
      line_item.destroy
    end
  end
end
