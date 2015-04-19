class LineItem < ActiveRecord::Base
	belongs_to :purchase_order
  has_one :item, dependent: :destroy
  accepts_nested_attributes_for :item

  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true
  validates :total_cost, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 99999999.99 }, presence: true
  validates :indicator, inclusion: { in: %w(shipped backorder unavailable) }, presence: true
end
