class Location < ApplicationRecord
  has_many :beds, dependent: :destroy
  has_many :bookings, dependent: :destroy
  belongs_to :user

  def no_of_places
    total = 0
    beds = self.beds
    beds.each do |bed|
      total += bed.size
    end
    total
  end
end
