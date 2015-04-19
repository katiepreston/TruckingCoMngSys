class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.string :year
      t.string :vehicle_model
      t.string :vehicle_type
      t.integer :archived
      t.timestamps null: false
    end
  end
end
