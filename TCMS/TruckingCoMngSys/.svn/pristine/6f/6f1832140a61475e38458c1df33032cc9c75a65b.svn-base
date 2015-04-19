class CreateRepairParts < ActiveRecord::Migration
  def change
    create_table :repair_parts do |t|
      t.references :repair_part_user, polymorphic: true
      t.integer :is_in_stock
      t.string :source
      t.integer :quantity
      t.decimal :total_cost, precision: 8, scale: 2
      t.timestamps null: false
    end
    add_index :repair_parts, [:repair_part_user_type, :repair_part_user_id], name: :repair_part_user_and_repair_parts_index
  end
end
