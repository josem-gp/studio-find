class AddColumnsToStudios < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :area, :integer
    add_column :studios, :capacity, :integer
    add_column :studios, :description, :text
  end
end
