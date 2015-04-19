class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
	t.references :company, index: true
      t.references :vehicle, index: true
      t.datetime :departed_at
      t.datetime :arrived_at
      t.integer :archived
      t.integer :is_outgoing
      t.integer :has_arrived
      t.integer :payment_received
      t.timestamps null: false
    end
	add_foreign_key :shipments, :companies
    add_foreign_key :shipments, :vehicles
  end
end
