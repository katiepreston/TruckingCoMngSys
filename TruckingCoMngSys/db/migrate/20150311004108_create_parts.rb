class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
	t.references :part_user, polymorphic: true, index: true
      t.string :name
      t.decimal :unit_cost, precision: 8, scale: 2
      t.decimal :total_cost, precision: 8, scale: 2
      t.integer :is_in_stock
      t.string :where_from
      t.integer :quantity
      t.timestamps null: false
    end
  end
end
