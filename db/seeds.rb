# frozen_string_literal: true

10.times do
  Product.create!(
    name: Faker::Game.title,
    description: Faker::Game.platform,
    price: Faker::Commerce.price
  )
end
