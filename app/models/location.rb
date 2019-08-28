class Location < ApplicationRecord
  has_many :beds, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user
end
