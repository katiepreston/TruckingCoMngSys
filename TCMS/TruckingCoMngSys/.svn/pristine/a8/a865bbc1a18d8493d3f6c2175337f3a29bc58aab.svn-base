class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :archived
      t.timestamps null: false
    end
    add_index :companies, :name, unique: true
  end
end
