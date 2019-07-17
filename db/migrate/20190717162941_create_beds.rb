class CreateBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :beds do |t|
      t.reference :location

      t.timestamps
    end
  end
end
