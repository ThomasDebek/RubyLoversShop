# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do

  before(:each) do
    @product = build(:product)
  end

  it "is has a valid factory" do
    expect(FactoryBot.build(:product)).to be_valid
  end

  it "is product attributes must not be empty" do
    product = @product
    @product.validate
    expect product.invalid?
    expect product.errors[:name].any?
    expect product.errors[:description].any?
    expect product.errors[:price].any?
  end

  it "is valid with a first name, description, and price" do
   expect(@product.valid?).to eql(true)
  end

  it "is invalid without a first name" do
    product = FactoryBot.build(:product, name: nil)
    product.valid?
    expect(product.errors[:name]).to include("can't be blank")
  end

  it "is invalid without a description" do
    product = FactoryBot.build(:product, description: nil)
    product.valid?
    expect(product.errors[:description]).to eql(["can't be blank"])
  end
  
  it 'is product price must be positive'
  it "is invalid without on price"










end
