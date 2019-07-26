class Bed < ApplicationRecord
  belongs_to :locations
  has_many :bookings
end
