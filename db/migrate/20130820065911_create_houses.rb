class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.string :name
      t.boolean :public

      t.timestamps
    end
  end
end
