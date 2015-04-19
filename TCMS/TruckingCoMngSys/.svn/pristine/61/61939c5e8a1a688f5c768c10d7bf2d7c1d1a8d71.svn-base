json.array!(@maintenance_parts) do |maintenance_part|
  json.extract! maintenance_part, :id, :references, :total_cost, :quantity
  json.url maintenance_part_url(maintenance_part, format: :json)
end
