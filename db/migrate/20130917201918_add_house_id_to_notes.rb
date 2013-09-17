class AddHouseIdToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :house_id, :integer
    add_index :notes, :house_id
  end
end
