class RoutineMaintenance < ActiveRecord::Base
  has_one :maintenance_item, as: :maintenance_type, dependent: :destroy
  has_many :parts, as: :part_user, dependent: :destroy

validates :description, presence: true
validates :performed_at, presence: true
end
