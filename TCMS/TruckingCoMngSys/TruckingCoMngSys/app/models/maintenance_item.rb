class MaintenanceItem < ActiveRecord::Base
  belongs_to :maintenance_type, polymorphic: true, dependent: :destroy
  belongs_to :maintenance_record
end
