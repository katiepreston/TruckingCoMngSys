class CreateRoutineInspections < ActiveRecord::Migration
  def change
    create_table :routine_inspections do |t|
      t.string :description
      t.datetime :performed_at
      t.timestamps null: false
    end
  end
end
