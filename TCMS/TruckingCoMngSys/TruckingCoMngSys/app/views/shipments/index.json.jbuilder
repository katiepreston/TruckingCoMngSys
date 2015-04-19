json.array!(@shipments) do |shipment|
  json.extract! shipment, :id
  json.url shipment_url(shipment, format: :json)
end
