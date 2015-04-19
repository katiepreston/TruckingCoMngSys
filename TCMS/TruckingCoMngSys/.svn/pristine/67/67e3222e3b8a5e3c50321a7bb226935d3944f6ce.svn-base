class CreateMaintenanceItems < ActiveRecord::Migration
  def change
    create_table :maintenance_items do |t|
      t.references :maintenance_type, polymorphic: true
      t.references :maintenance_record, index: true

      t.timestamps null: false
    end
    add_foreign_key :maintenance_items, :maintenance_records
    add_index :maintenance_items, [:maintenance_type_type, :maintenance_type_id], name: :maintenance_item_and_maintenance_type_index
  end
end
