# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @product = build(:product)
  end

  it 'is has a valid factory' do
    expect(FactoryBot.build(:product)).to be_valid
  end

  it 'is product attributes must not be empty' do
    product = @product
    @product.validate
    expect product.invalid?
    expect product.errors[:name].any?
    expect product.errors[:description].any?
    expect product.errors[:price].any?
    expect product.errors[:image_url].any?
  end

  it 'is valid with a first name, description, price and image_url' do
    expect(@product.valid?).to eql(true)
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
    product = FactoryBot.build(:product, price: nil)
    product.valid?
    product.should_not be_valid
  end

  it 'is product price must be positive ' do
    product = Product.new(name: 'My book Title', description: 'yyy')

    product.price = -1
    assert product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 0
    expect product.invalid?
    assert_equal ['must be greater than or equal to 0.01'], product.errors[:price]

    product.price = 1
    expect product.valid?
  end

  it ' is image url must be a good format' do
    def new_product(image_url)
      Product.new(name: 'My Book Title', description: 'yyy', price: 1, image_url: image_url)
    end

    ok = %w[fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif]
    bad = %w[fred.doc fred.gif/more fred.gif.more]
    ok.each do |image_url|
      assert new_product(image_url).valid?, "#{image_url} shouldn't be invalid"
    end
    bad.each do |image_url|
      assert new_product(image_url).invalid?, "#{image_url} shouldn't be valid"
    end
  end
end
