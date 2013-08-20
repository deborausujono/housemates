class AddHouseRefToPeople < ActiveRecord::Migration
  def change
    add_column :people, :house_id, :integer
    add_index :people, :house_id
  end
end
