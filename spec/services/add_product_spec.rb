# frozen_string_literal: true

require 'rails_helper'

describe AddProduct, type: :service do
  let(:cart) { create :cart }
  let(:product) { create :product }

  describe "Testing service" do

    subject do
      AddProduct.new.call(product: product, cart: cart)
    end

    describe 'Testing quantity' do
      context 'with correct quantity' do
        let(:quantity) { 1 }
        it 'is valid' do
          expect(subject).to be_valid
        end

        it 'is in the cart' do
          expect(cart.line_items).to include(subject)
        end
      end
    end
  end
end
