# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150410212735) do

  create_table "addresses", force: :cascade do |t|
    t.integer  "street_number"
    t.string   "street_name"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.integer  "addressable_id"
    t.string   "addressable_type"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "addresses", ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.integer  "archived"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "username"
    t.integer  "account_type"
    t.string   "password_digest"
    t.string   "home_phone"
    t.string   "cell_phone"
    t.decimal  "pay_rate",        precision: 5, scale: 2
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "archived"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "employees_shipments", id: false, force: :cascade do |t|
    t.integer "employee_id"
    t.integer "shipment_id"
  end

  add_index "employees_shipments", ["employee_id", "shipment_id"], name: "index_employees_shipments_on_employee_id_and_shipment_id", unique: true
  add_index "employees_shipments", ["employee_id"], name: "index_employees_shipments_on_employee_id"
  add_index "employees_shipments", ["shipment_id"], name: "index_employees_shipments_on_shipment_id"

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.decimal  "unit_cost",    precision: 8, scale: 2
    t.integer  "line_item_id"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "items", ["line_item_id"], name: "index_items_on_line_item_id"

  create_table "line_items", force: :cascade do |t|
    t.integer  "purchase_order_id"
    t.integer  "quantity"
    t.decimal  "total_cost",        precision: 10, scale: 2
    t.string   "indicator"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "line_items", ["purchase_order_id"], name: "index_line_items_on_purchase_order_id"

  create_table "maintenance_items", force: :cascade do |t|
    t.integer  "maintenance_type_id"
    t.string   "maintenance_type_type"
    t.integer  "maintenance_record_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "maintenance_items", ["maintenance_record_id"], name: "index_maintenance_items_on_maintenance_record_id"
  add_index "maintenance_items", ["maintenance_type_type", "maintenance_type_id"], name: "maintenance_item_and_maintenance_type_index"

  create_table "maintenance_records", force: :cascade do |t|
    t.integer  "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "maintenance_records", ["vehicle_id"], name: "index_maintenance_records_on_vehicle_id"

  create_table "parts", force: :cascade do |t|
    t.integer  "part_user_id"
    t.string   "part_user_type"
    t.string   "name"
    t.decimal  "unit_cost",      precision: 8, scale: 2
    t.decimal  "total_cost",     precision: 8, scale: 2
    t.integer  "is_in_stock"
    t.string   "where_from"
    t.integer  "quantity"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "parts", ["part_user_type", "part_user_id"], name: "index_parts_on_part_user_type_and_part_user_id"

  create_table "purchase_orders", force: :cascade do |t|
    t.integer  "shipment_id"
    t.decimal  "sub_total",   precision: 10, scale: 2
    t.decimal  "shipping",    precision: 10, scale: 2
    t.decimal  "grand_total", precision: 10, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "purchase_orders", ["shipment_id"], name: "index_purchase_orders_on_shipment_id"

  create_table "repair_parts", force: :cascade do |t|
    t.integer  "repair_part_user_id"
    t.string   "repair_part_user_type"
    t.integer  "is_in_stock"
    t.string   "source"
    t.integer  "quantity"
    t.decimal  "total_cost",            precision: 8, scale: 2
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  add_index "repair_parts", ["repair_part_user_type", "repair_part_user_id"], name: "repair_part_user_and_repair_parts_index"

  create_table "repair_records", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "performed_at"
  end

  create_table "routine_inspections", force: :cascade do |t|
    t.string   "description"
    t.datetime "performed_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "routine_maintenances", force: :cascade do |t|
    t.string   "description"
    t.datetime "performed_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shipments", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "vehicle_id"
    t.datetime "departed_at"
    t.datetime "arrived_at"
    t.integer  "archived"
    t.integer  "is_outgoing"
    t.integer  "has_arrived"
    t.integer  "payment_received"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "shipments", ["company_id"], name: "index_shipments_on_company_id"
  add_index "shipments", ["vehicle_id"], name: "index_shipments_on_vehicle_id"

  create_table "vehicles", force: :cascade do |t|
    t.string   "brand"
    t.string   "year"
    t.string   "vehicle_model"
    t.string   "vehicle_type"
    t.integer  "archived"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
