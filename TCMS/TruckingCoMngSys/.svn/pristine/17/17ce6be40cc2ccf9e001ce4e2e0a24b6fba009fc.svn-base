class EmployeeShipmentTable < ActiveRecord::Migration
  def change
    create_table :employees_shipments, id: false do |t|
      t.belongs_to :employee, index: true
      t.belongs_to :shipment, index: true
    end
    add_index :employees_shipments, [:employee_id, :shipment_id], unique: true
  end
end
