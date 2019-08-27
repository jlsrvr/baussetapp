class Booking < ApplicationRecord
  belongs_to :user
  has_many :combinations
  has_many :beds, through: :combinations

  validates :status, inclusion: { in: %w[pending accepted declined] }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
