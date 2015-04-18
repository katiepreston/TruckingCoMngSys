class Company < ActiveRecord::Base
	has_one :address, as: :addressable, dependent: :destroy
	has_many :shipments, dependent: :destroy
	accepts_nested_attributes_for :address

  validates :name, presence: true, uniqueness: true
  validate :check_archived

  private

  def check_archived
    self.archived = 0 if self.archived.blank?
  end
end
