# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:cart) { create :cart }
  let(:product) { create :product }
  let(:quantity) { 1 }

  subject do
    LineItem.new(
        product: product,
        cart: cart,
        quantity: quantity
    )
  end

  context 'With correct attributes' do
    let(:quantity) { 2 }
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'without cart' do
    let(:cart) { nil }
    it 'is not valid without cart_id' do
      expect(subject).to_not be_valid
    end
  end

  context 'with no product find' do
    let(:product) { nil }
    it 'is not valid' do
      expect(subject).to_not be_valid
    end
  end

  context 'To much products' do
    let(:quantity) { 6 }
    it 'give an error' do
      expect(subject).to_not be_valid
      expect(subject.errors[:quantity]).to include('must be less than or equal to 5')
    end
  end

  context 'Negative number' do
    let(:quantity) { -5 }
    it 'give an error' do
      expect(subject).to_not be_valid
      expect(subject.errors[:quantity]).to include('must be greater than or equal to 1')
    end
  end
end
