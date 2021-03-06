class Employee < ActiveRecord::Base
	include ActiveModel::SecurePassword
	has_one :address, as: :addressable, dependent: :destroy
	has_and_belongs_to_many :shipments
	has_secure_password
        accepts_nested_attributes_for :address

        @@name_pattern = /\A([a-zA-Z'\-\.]+ )*([a-zA-Z'\-\.]+)\z/

  validates :first_name, format: @@name_pattern, presence: true
  validate :check_middle_name
  validates :last_name, format: @@name_pattern, presence: true
  validates :username, format: /\A[a-z]{3}[0-9]{4}\z/, presence: true, uniqueness: true
  validates :account_type, presence: true, inclusion: { in: [EmployeesController::Full, EmployeesController::Shipping, EmployeesController::Maintenance, EmployeesController::Driver] }
  validates :home_phone, format: /\A[1-9][0-9]{9}\z/, presence: true
  validates :cell_phone, format: /\A[1-9][0-9]{9}\z/, presence: true, uniqueness: true
  validates :pay_rate, presence: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 999.99 },
    format: /\A([1-9][0-9]{1,4}|[0-9])(\.[0-9]{0,2})?\z/
  validate :check_dates
  validate :check_archive

  def years_with_company
    d = DateTime.now
    if self.ended_at.blank?
      if d.month > self.started_at.month || d.month == self.started_at.month && d.day >= self.started_at.day
        d.year - self.started_at.year
      else
        d.year - self.started_at.year - 1
      end
    else
      if self.ended_at.month > self.started_at.month || self.ended_at.month == self.started_at.month && self.ended_at.day >= self.started_at.day
        self.ended_at.year - self.started_at.year
      else
        self.ended_at.year - self.started_at.year - 1
      end
    end
  end

  private

  def check_middle_name
    if !(self.middle_name.blank?)
      errors.add(:base, "Middle Name not valid") if !(self.middle_name =~ @@name_pattern)
    end
  end

  def check_dates
    errors.add(:base, "Start date cannot be blank") and return if self.started_at.blank?
    if !(self.ended_at.blank?)
      errors.add(:base, "Termination date cannot be before start date") if self.ended_at.to_i < self.started_at.to_i
    end
  end

  def check_archive
    self.archived = 0 if self.archived.blank?
  end
end
