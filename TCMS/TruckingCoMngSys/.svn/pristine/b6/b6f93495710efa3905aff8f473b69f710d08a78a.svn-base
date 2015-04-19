class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :street_number
      t.string :street_name
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :addressable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
