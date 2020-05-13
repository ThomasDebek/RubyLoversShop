# frozen_string_literal: true

FactoryBot.define do
  factory :cart do
    trait :cart_is_full do
      after(:create) { |cart| create_list(:line_item, 10, cart: cart) }
    end

  end
end
