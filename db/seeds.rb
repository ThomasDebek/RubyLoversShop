# frozen_string_literal: true

rails db:reset

10.times do
  Product.create!(
    name: Faker::Game.title,
    description: Faker::Game.platform,
    price: Faker::Commerce.price,
    image_url: Faker::Avatar.image
  )
end
