class ChangeStatusInBookings < ActiveRecord::Migration[6.0]
  def change
    remove_column :bookings, :status, :boolean, :default => false
    add_column :bookings, :status, :integer, :default => 0
  end
end
