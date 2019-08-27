class AddColumnPlacesToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :place, :integer
  end
end
