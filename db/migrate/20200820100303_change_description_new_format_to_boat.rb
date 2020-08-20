class ChangeDescriptionNewFormatToBoat < ActiveRecord::Migration[6.0]
  def change
    remove_column :boats, :description, :string
    add_column :boats, :description, :text
  end
end
