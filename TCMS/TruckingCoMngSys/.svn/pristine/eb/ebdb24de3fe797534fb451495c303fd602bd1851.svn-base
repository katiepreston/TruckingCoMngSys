class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.decimal :unit_cost, precision: 8, scale: 2
      t.references :line_item, index: true

      t.timestamps null: false
    end
    add_foreign_key :items, :line_items
  end
end
