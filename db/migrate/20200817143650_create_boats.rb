class CreateBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :boats do |t|
      t.string :brand
      t.integer :price
      t.string :location
      t.string :type

      t.timestamps
    end
  end
end
