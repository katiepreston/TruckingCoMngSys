json.array!(@repair_records) do |repair_record|
  json.extract! repair_record, :id
  json.url repair_record_url(repair_record, format: :json)
end
