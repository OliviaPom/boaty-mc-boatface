class AddUserReferenceToBoats < ActiveRecord::Migration[6.0]
  def change
    add_reference :boats, :user
  end
end
