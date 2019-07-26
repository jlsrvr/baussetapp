class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :locations
  has_many :bookings_as_host, through: :locations
  has_many :bookings
  has_many :beds, through: :locations

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
