class ChangeStatusDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :bookings, :status, :boolean, :default => false
  end
end
