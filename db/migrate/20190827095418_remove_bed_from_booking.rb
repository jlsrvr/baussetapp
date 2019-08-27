class RemoveBedFromBooking < ActiveRecord::Migration[5.2]
  def change
    change_table :bookings do |t|
      t.remove :bed_id
    end
  end
end
