# frozen_string_literal: true

class SearchProduct
  def call(phrase)
    # query = ApplicationRecord.sanitize_sql_array(['SELECT products.* FROM products WHERE products.name ILIKE ?', "%#{phrase}%"])
    # Product.find_by_sql(query)
    # Product.where("products.name ILIKE ?", "%#{phrase}%")
    Product.search_by_name(phrase)
  end
end
