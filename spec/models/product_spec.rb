# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  let!(:product) { create :product }

  describe 'Validate Factory ' do
    it 'has a valid factory' do
      expect(FactoryBot.build(:product)).to be_valid
    end
  end

  describe 'Validate' do
    context 'when data are valid' do
      it 'has correct build' do
        expect(product).to be_valid
      end

      it 'is invalid without a first name' do
        product.name = nil
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end
    end
  end

  context 'when data are invalid' do
    it 'has no name' do
      product.name = nil
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is product attributes name must not be empty' do
      product.invalid?
      expect product.errors[:name].any?
    end

    it 'is product attributes description must not be empty' do
      product.invalid?
      expect product.errors[:description].any?
    end

    it 'is product attributes price must not be empty' do
      product.invalid?
      expect product.errors[:price].any?
    end

    it 'is valid with a first name, description, and price' do
      expect(product.valid?).to eql(true)
    end

    it 'is invalid without a first name' do
      product.name = nil
      product.valid?
      expect(product.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without a description' do
      product.description = nil
      product.valid?
      expect(product.errors[:description]).to eql(["can't be blank"])
    end

    describe "Price" do
      it "is product price must be positive'" do
        product.valid?
        expect(product).to be_valid
      end

      it 'has no price' do
        expect(build(:product, price: nil)).to_not be_valid
      end

      it 'is product price must be positive ' do
        product.price = -1
        product.invalid?
        expect(product.errors[:price]).to eql(['must be greater than or equal to 0.01'])

        product.price = 0
        product.invalid?
        expect(product.errors[:price]).to eql(['must be greater than or equal to 0.01'])
      end
    end

    describe 'Validations second' do
      context 'name is nil' do
        it 'has no name ' do
          product.name = nil
          expect(product).to_not be_valid
        end
      end
    end
  end
end





