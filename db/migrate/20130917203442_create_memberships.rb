class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :house_id
      t.integer :person_id

      t.timestamps
    end
  end
end
