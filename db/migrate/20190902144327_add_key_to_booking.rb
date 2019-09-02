class AddKeyToBooking < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :key, :boolean, default: false
  end
end
