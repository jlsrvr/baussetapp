class Combination < ApplicationRecord
  belongs_to :bed
  belongs_to :booking

  validates :booking, presence: true
  validates :bed, presence: true
end
