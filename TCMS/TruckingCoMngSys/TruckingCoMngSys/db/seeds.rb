# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#|var_street_number, var_street_name, var_city, var_state, var_zip_code |
address_list = [
  [ 100, "Alpha Street", "Madison", "Alabama", "35758"  ],
  [ 101, "Bravo Street", "Huntsville", "Alabama", "35803"  ],
  [ 103, "Charlie Street", "Huntsville", "Alabama", "35824"  ],
  [ 104, "Delta Street", "Gardendale", "Alabama", "35071"  ],
  [ 105, "Echo Street", "Arab", "Alabama", "35016"  ],
  [ 106, "Foxtrot Street", "Gardendale", "Alabama", "35071"  ],
  [ 107, "Golf Street", "Gardendale", "Alabama", "35071"  ],
  [ 108, "Hotel Street", "Gardendale", "Alabama", "35071" ],
  [ 109, "Igloo Street", "Gardendale", "Alabama", "35071"  ],
  [ 110, "Juliet Street", "Gardendale", "Alabama", "35071"  ]
]

address_list.each do |var_street_number, var_street_name, var_city, var_state, var_zip_code |
  Address.create( street_number: var_street_number, street_name: var_street_name, 
                  city: var_city, state: var_state, zip_code: var_zip_code )
end  
####################################################################################################################

#name: var_name
company_list = [
   "The department of redundancy department" 
]

company_list.each do | var_name |
  c = Company.new( name: var_name )
  c.address = Address.find_by(id: 6)
  c.save
end

####################################################################################################################

#|var_first_name, var_middle_name, var_last_name, var_username, var_account_type, var_home_phone, var_cell_phone, #var_pay_rate, var_years_with_company |
employee_list = [
  [ "John", "Jacob", "Smith", "jjs0001", EmployeesController::Full, "2234567890", "3876543210",  100.00, DateTime.now - 2.year, "password" ], 
  [ "Jane", "Jannet", "Doe", "jjd0005", EmployeesController::Shipping, "1111111111", "1222222222",  20.00, DateTime.now - 3.year, "12345" ],
  [ "John", "Henry", "Davis", "jhd0012", EmployeesController::Maintenance, "1555555555", "1555555555",  15.00, DateTime.now - 7.year, "john" ],
  [ "Colonel", "Sanders", "Chicken", "kfc1930", EmployeesController::Driver, "1659846297", "1087628267",  10.00, DateTime.now - 2.year, "chicken" ],
  [ "Walter", "William", "Watson", "www1111", EmployeesController::Driver, "1458960985", "1878766543",  12.00, DateTime.now - 5.year, "dotcom" ]
]
i=1
employee_list.each do |var_first_name, var_middle_name, var_last_name, var_username, var_account_type, var_home_phone, var_cell_phone, var_pay_rate, var_started_at, var_password |
  e = Employee.new( first_name: var_first_name, middle_name: var_middle_name, last_name: var_last_name, 
                   username: var_username, account_type: var_account_type, home_phone: var_home_phone, 
                   cell_phone: var_cell_phone, pay_rate: var_pay_rate, started_at: var_started_at,
                   password: var_password, password_confirmation: var_password)
  e.address = Address.find_by(id: i)
  i = i+1                 
  e.save
end

####################################################################################################################

#name var_brand, var_year, var_vehicle_model, var_vehicle_type
vehicle_list = [
  [ "Ferrari", 2015, "458 Italia", "truck" ],
  [ "Lambourghini", 2015, "Murcielago", "truck" ],
  [ "Fred", 2000, "Green", "uhhhh"]
]

repair_records = [
   "Tires rotated" ,
   "Splines Reticulated" ,
  "Driver defenestrated" ,
  "Flares deployed",
  "Lug nuts greased"
]

repair_parts = [
  [ 1, "in stock", 0.00 ],
  [ 0, "advanced auto", 350.00],
  [ 1, "in stock", 0.00],
  [ 1, "in stock", 0.00],
  [ 0, "AirNav", 1000.00]
]

part_list = [
   "Headlight Fluid" ,
   "Steering Wheels" ,
   "Lug Nuts" ,  
   "Elbow Grease" ,
   "Jet Fuel" 
]

routine_inspections = [
   "Inspections inspected",
   "Second Inspection" 
]

routine_maintenances = [
  "Maintenance Maintenanced",
  "Another maintenance maintenanced"
]

vehicle_list.each do | var_brand, var_year, var_vehicle_model, var_vehicle_type |
  v = Vehicle.new( brand: var_brand, year: var_year, vehicle_model: var_vehicle_model, vehicle_type: var_vehicle_type )
  v.maintenance_record= MaintenanceRecord.new
  v.save
end

v = Vehicle.find_by(id: 1)
mi = MaintenanceItem.new
ri = RoutineInspection.new(description: routine_inspections[0], performed_at: DateTime.new(2013, 4, 13, 12, 0, 0, "-5"))
ri.maintenance_item = mi
v.maintenance_record.maintenance_items << mi
ri.save
v.save

v = Vehicle.find_by(id: 2)
mi = MaintenanceItem.new
rm = RoutineMaintenance.new(description: routine_maintenances[0], performed_at: DateTime.new(2014, 5, 3, 8, 30, 0, "-5"))
p = Part.new( is_in_stock: 1, quantity: 3, total_cost: 0, name: part_list[0], unit_cost: 20.00 )
rm.maintenance_item = mi
rm.parts << p
v.maintenance_record.maintenance_items << mi
rm.save
v.save

v = Vehicle.find_by(id: 3)
mi = MaintenanceItem.new
rr = RepairRecord.new(description: repair_records[2], performed_at: DateTime.new(2015, 3, 4, 14, 3, 0, "-5"))
p = Part.new( name: part_list[4], unit_cost: 500.00, quantity: 3, is_in_stock: 1, total_cost: 0)
rr.maintenance_item = mi
rr.parts << p
v.maintenance_record.maintenance_items << mi
v.parts << Part.new( name: "set of tires", unit_cost: 300, is_in_stock: 0, quantity: 2, total_cost: 0, where_from: "Advanced Auto")
v.parts << Part.new( name: "windshield", unit_cost: 10, is_in_stock: 1, quantity: 1, total_cost: 0)
v.save
rr.save


####################################################################################################################

#name  departed_at, arrived_at, var_is_outgoing, var_has_arrived, var_payment_received
shipment_list = [
  [ DateTime.new(2015, 4, 4, 9, 0, 0, "-5"), DateTime.new(2015, 4, 4, 11, 0, 0, "-5"), 1, 0, 0 ]
  ]

#begin...
line_item_list = [
  [ 2, 152599.99, "shipped"],
  [ 84, 2939.16, "backorder"],
  [ 20, 19759.8, "unavailable"],
  [ 300, 3897.00, "shipped"],
  [70000, 69300.00, "backorder"]
]

item_list = [
  [ "philange", 152599.99 ],
  [ "thingamabob", 34.99 ],
  [ "jiggydig", 987.99 ],  
  [ "whatsit", 12.99 ],
  [ "gidget", 0.99 ],
]
#end...

i=1
shipment_list.each do |var_departed_at, var_arrived_at, var_is_outgoing, var_has_arrived, var_payment_received |
  s = Shipment.new( departed_at: var_departed_at, arrived_at: var_arrived_at, is_outgoing: var_is_outgoing, has_arrived: var_has_arrived, payment_received: var_payment_received )
  s.vehicle = Vehicle.find_by(id: i)
  s.company = Company.find_by(id: 1)
  s.drivers << Employee.find_by(id: 4)
#begin...
  po = PurchaseOrder.new(grand_total: 0, sub_total: 0, shipping: 0)
  li = LineItem.new(quantity: line_item_list[i-1][0], indicator: line_item_list[i-1][2])
  it = Item.new(name: item_list[i-1][0], unit_cost: item_list[i-1][1])
  it.save
  li.item = it
  li.total_cost = li.item.unit_cost * li.quantity
  li.save
  po.line_items << li
  po.line_items.each do |l|
    po.sub_total += l.total_cost
  end
  po.shipping = (po.sub_total * 0.2).round(2)
  po.grand_total = po.sub_total + po.shipping
  po.save
  s.purchase_order = po
#end...
  i=i+1
  s.save
#todo: attach companies  
end


####################################################################################################################

#name: var_description





####################################################################################################################

#name: var_is_in_stock, var_source, var_cost


