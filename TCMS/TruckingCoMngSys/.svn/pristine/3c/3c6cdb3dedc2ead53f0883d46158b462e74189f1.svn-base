class RoutineInspection < ActiveRecord::Base
  has_one :maintenance_item, as: :maintenance_type, dependent: :destroy

  validates :description, presence: true
  validates :performed_at, presence: true
end
