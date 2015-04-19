class RepairPart < ActiveRecord::Base
  belongs_to :repair_part_user, polymorphic: true
  has_one :part, as: :part_user, dependent: :destroy

  validates :is_in_stock, presence: true
  validates :source, presence: true, format: { with: /\A([a-zA-Z0-9\'\-]+ )*([a-zA-Z0-9\'\-]+)\z/ }, if: "!(:is_in_stock)"
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :total_cost, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 9999.99 }
end
