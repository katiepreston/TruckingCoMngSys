class Shipment < ActiveRecord::Base
  belongs_to :company
  belongs_to :vehicle
  has_one :purchase_order, dependent: :destroy
  has_and_belongs_to_many :drivers, class_name: "Employee"
  accepts_nested_attributes_for :drivers, :vehicle, :company, :purchase_order

  Employee_Limit = 2

  validates :payment_received, presence: true
  validates :departed_at, presence: true
  validates :arrived_at, presence: true
  validates :is_outgoing, presence: true
  validates :has_arrived, presence: true
  validate :valid_dates?
  validate :num_employees
  validate :archive

  private

  def archive
    self.archived = 0 if self.archived.blank?
  end

  def valid_dates?
    errors.add(:base, "Arrival date cannot be blank") if self.arrived_at.nil?
    errors.add(:base, "Departure date cannot be blank") and return if self.departed_at.nil?
    errors.add(:base, "Arrival date cannot be before the departure date") if self.departed_at > self.arrived_at
  end

  def num_employees
    errors.add(:base, "Cannot have more than #{Employee_Limit} drivers. You have " + drivers.first.to_s) if self.drivers.size > Employee_Limit
  end
end
