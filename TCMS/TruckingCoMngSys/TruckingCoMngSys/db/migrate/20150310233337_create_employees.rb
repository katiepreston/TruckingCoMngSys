class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :username
      t.integer :account_type
      t.string :password_digest
      t.string :home_phone
      t.string :cell_phone
      t.decimal :pay_rate, precision: 5, scale: 2
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :archived
      t.timestamps null: false
    end
  end
end
