# frozen_string_literal: true

class Product < ApplicationRecord
  include PgSearch::Model

  has_many :line_items
  before_destroy :ensure_not_referenced_by_any_line_item

  validates :name, presence: true
  validates :description, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
  validates :image_url, allow_blank: true, format: {
      with:    %r{\.(gif|jpg|png)\Z}i,
      message: 'must be a URL for GIF, JPG or PNG image.'
  }

  pg_search_scope :search_by_name, against: :name, using: { dmetaphone: {}, trigram: {}, tsearch: { prefix: true, any_word: true } }

  private
   def ensure_not_referenced_by_any_line_item
     unless line_items.empty?
       errors.add(:base, 'Line Items present')
       throw :abort
     end
   end

end

