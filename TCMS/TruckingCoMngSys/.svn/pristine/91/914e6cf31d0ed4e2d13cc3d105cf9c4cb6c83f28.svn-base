class Item < ActiveRecord::Base
  belongs_to :line_item

  validates :name, presence: true
  validates :unit_cost, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 999999.99 },
    format: /\A[1-9]?[0-9]{0,7}(\.[0-9]{0,2})?\z/
end
