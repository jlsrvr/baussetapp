class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bed

  validates :status, inclusion: { in: %w[pending accepted declined] }
  # validates :date, presence: true
end
