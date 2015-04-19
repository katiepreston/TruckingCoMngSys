json.array!(@maintenance_items) do |maintenance_item|
  json.extract! maintenance_item, :id, :maintenance_type_id, :maintenance_type_type, :maintenance_record_id
  json.url maintenance_item_url(maintenance_item, format: :json)
end
