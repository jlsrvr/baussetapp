class Booking < ApplicationRecord
  belongs_to :user
  has_many :beds, through: :combination
  belongs_to :location, through: :bed

  validates :status, inclusion: { in: %w[pending accepted declined] }
  validates :start_date, presence: true
  validates :end_date, presence: true
end
