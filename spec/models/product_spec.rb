# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { create :product }

  context 'when data are valid' do
    it 'has correct build' do
      expect(build(:product)).to be_valid
    end
    it 'is invalid without a first name' do
      product = Product.new(name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end
  end

  context 'when data are invalid' do
    it 'has no title' do
      expect(build(:product, name: nil)).to_not be_valid
    end

    it 'has no price' do
      expect(build(:product, price: nil)).to_not be_valid
    end

    it 'has a valid factory' do
      expect(FactoryBot.build(:product)).to be_valid
    end

    it 'is product attributes must not be empty' do
      expect product.invalid?
      expect product.errors[:name].any?
      expect product.errors[:description].any?
      expect product.errors[:price].any?
    end

    it 'is valid with a first name, description, and price' do
      expect(product.valid?).to eql(true)
    end

    it 'is invalid without a first name' do
      product = FactoryBot.build(:product, name: nil)
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      product = FactoryBot.build(:product, description: nil)
      product.valid?
      expect(product.errors[:description]).to eql(["can't be blank"])
    end

    it "is product price must be positive'" do
      product.valid?
      expect(product).to be_valid
    end

    it 'is product price must be positive ' do
      product.price = -1
      assert product.invalid?
      assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]
      product.price = 0
      expect product.invalid?
      assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]
      product.price = 1
      expect product.valid?
    end
  end
end
