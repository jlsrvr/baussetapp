class Booking < ApplicationRecord
  include ActiveModel::Validations
  belongs_to :user
  belongs_to :location
  has_many :combinations
  has_many :beds, through: :combinations

  validates_with MyValidator
  validates :place, presence: true, numericality: { greater_than: 0 }
  validates :status, inclusion: { in: %w[pending accepted declined] }
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :location, presence: true

  def mark_as(state)
    if %w[accepted declined pending].include?(state)
      self.status = state
    end
  end
end
