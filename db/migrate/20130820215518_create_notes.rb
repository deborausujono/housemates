class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.text :text
      t.references :person

      t.timestamps
    end
    add_index :notes, :person_id
  end
end
