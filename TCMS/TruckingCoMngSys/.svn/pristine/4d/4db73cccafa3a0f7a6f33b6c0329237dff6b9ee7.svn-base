class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
	t.references :purchase_order, index: true
      t.integer :quantity
      t.decimal :total_cost, precision: 10, scale: 2
      t.string :indicator
      t.timestamps null: false
    end
	add_foreign_key :line_items, :purchase_orders
  end
end
