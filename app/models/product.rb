# frozen_string_literal: true

class Product < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
end
