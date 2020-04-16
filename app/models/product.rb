# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }

  pg_search_scope :search_by_name, against: :name, using: { dmetaphone: {}, trigram: {}, tsearch: { prefix: true, any_word: true }}
end
