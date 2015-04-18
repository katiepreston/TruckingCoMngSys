class Vehicle < ActiveRecord::Base
  has_many :shipments, dependent: :nullify
  has_one :maintenance_record, dependent: :destroy
  has_many :parts, as: :part_user, dependent: :destroy

  validates :brand, presence: true
  validates :year, presence: true, format: /\A20[0-9]{2}\z/
  validates :vehicle_model, presence: true
  validates :vehicle_type, presence: true
  validate :archive

  private

  def archive
    self.archived = 0 if self.archived.blank?
  end
end
