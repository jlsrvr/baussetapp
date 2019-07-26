class AddSizeAndNameToBed < ActiveRecord::Migration[5.2]
  def change
    add_column :beds, :size, :integer
    add_column :beds, :name, :string

  end
end
