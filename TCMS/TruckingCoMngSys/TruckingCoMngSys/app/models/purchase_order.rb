class PurchaseOrder < ActiveRecord::Base
	belongs_to :shipment
  has_many :line_items, dependent: :destroy

  validates :shipping, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 99999999.99 }
  validates :grand_total, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 99999999.99 }
end
