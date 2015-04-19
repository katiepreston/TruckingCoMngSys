class MaintenanceRecord < ActiveRecord::Base
  belongs_to :vehicle
  has_many :maintenance_items, dependent: :destroy
end
