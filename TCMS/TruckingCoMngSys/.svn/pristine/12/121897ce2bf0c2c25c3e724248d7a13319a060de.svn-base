class Part < ActiveRecord::Base
	belongs_to :part_user, polymorphic: true

  validates :name, presence: true
  validates :is_in_stock, presence: true, inclusion: { in: [0, 1] }
  validate :check_where_from
  validates :unit_cost, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 999999.99 }, format: /\A([1-9][0-9]{1,5}|[0-9])(\.[0-9]{1,2})?\z/, if: "self.is_in_stock == 0"
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validate :check_total_cost

  def check_where_from
    if self.is_in_stock == 1
      self.where_from = "Company Stocks"
    end
    if self.where_from.blank?
      errors.add(:base, "Must include where part came from")
    end
  end

  def check_total_cost
    local_unit_cost = self.unit_cost
    local_unit_cost = 0 if self.is_in_stock == 1
    self.total_cost = local_unit_cost.to_f * self.quantity.to_i
    if !(self.total_cost >= 0 && self.total_cost <= 999999.99)
      errors.add(:base, "Total cost must not exceed $999,999.99")
    end
  end
end
