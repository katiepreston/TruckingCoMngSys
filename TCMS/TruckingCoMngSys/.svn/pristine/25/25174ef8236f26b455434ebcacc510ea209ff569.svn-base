class CreateRepairRecords < ActiveRecord::Migration
  def change
    create_table :repair_records do |t|
      t.string :description
      t.timestamps null: false
      t.datetime :performed_at
    end
  end
end
