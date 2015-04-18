json.array!(@vehicle_inspections) do |vehicle_inspection|
  json.extract! vehicle_inspection, :id
  json.url vehicle_inspection_url(vehicle_inspection, format: :json)
end
