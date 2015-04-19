class RepairRecord < ActiveRecord::Base
  has_many :parts, as: :part_user, dependent: :destroy
  has_one :maintenance_item, as: :maintenance_type, dependent: :destroy

  validates :performed_at, presence: true
  validates :description, presence: true
end
