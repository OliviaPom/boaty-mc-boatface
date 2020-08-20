class AddNumberPassengerToBoat < ActiveRecord::Migration[6.0]
  def change
    add_column :boats, :number_passenger, :integer
  end
end
