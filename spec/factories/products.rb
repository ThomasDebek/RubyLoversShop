# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'product' }
    description { 'description' }
    price { '44.33' }
  end

  factory :product_invalid do
    name { nil }
    description { 'description' }
    price { '44.33' }
  end
end
