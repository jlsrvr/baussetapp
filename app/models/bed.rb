class Bed < ApplicationRecord
  belongs_to :location
  has_many :bookings
end
