class CreatePurchaseOrders < ActiveRecord::Migration
  def change
    create_table :purchase_orders do |t|
	t.references :shipment, index: true
      t.decimal :sub_total, precision: 10, scale: 2
      t.decimal :shipping, precision: 10, scale: 2
      t.decimal :grand_total, precision: 10, scale: 2
      t.timestamps null: false
    end
	add_foreign_key :purchase_orders, :shipments
  end
end
