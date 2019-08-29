class Booking < ApplicationRecord
  include ActiveModel::Validations
  validates_with MyValidator
  belongs_to :user
  belongs_to :location
  has_many :combinations
  has_many :beds, through: :combinations

  validates :status, inclusion: { in: %w[pending accepted declined] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true
  validates :place, presence: true
end
