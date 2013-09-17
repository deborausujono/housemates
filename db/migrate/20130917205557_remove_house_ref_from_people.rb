class RemoveHouseRefFromPeople < ActiveRecord::Migration
  def up
    remove_column :people, :house_id
  end

  def down
    add_column :people, :house_id, :integer
  end
end
