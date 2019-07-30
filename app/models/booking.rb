class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bed

  validates :status, inclusion: { in: %w[pending accepted declined] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :bed, presence: true
end
