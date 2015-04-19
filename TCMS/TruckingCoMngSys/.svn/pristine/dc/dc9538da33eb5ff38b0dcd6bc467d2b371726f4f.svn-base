class CreateMaintenanceRecords < ActiveRecord::Migration
  def change
    create_table :maintenance_records do |t|
      t.references :vehicle, index: true

      t.timestamps null: false
    end
  end
end
