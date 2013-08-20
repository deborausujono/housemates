class AddNameAndPublicToPeople < ActiveRecord::Migration
  def change
    add_column :people, :name, :string
    add_column :people, :public, :boolean
  end
end
