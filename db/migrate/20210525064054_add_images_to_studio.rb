class AddImagesToStudio < ActiveRecord::Migration[6.0]
  def change
    add_column :studios, :images, :string
  end
end
