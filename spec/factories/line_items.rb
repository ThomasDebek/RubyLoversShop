# frozen_string_literal: true

FactoryBot.define do
  factory :line_item do
    quantity { 1 }
    product { nil }
    cart { nil }
  end
end
