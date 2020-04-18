# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'product' }
    description { 'description' }
    price { '44.33' }
    image_url { 'image.jpg' }
  end
end
