class Bed < ApplicationRecord
  belongs_to :location
  has_many :bookings

  validates :location, presence: true
  validates :size, presence: true, numericality: { greater_than: 0 }
  validates :name, presence: true, uniqueness: { scope: :location }
end
