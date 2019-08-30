class AddDefaultValueToPlaceInBooking < ActiveRecord::Migration[5.2]
  def change
    change_column_default :bookings, :place, from: nil, to: 0
  end
end
