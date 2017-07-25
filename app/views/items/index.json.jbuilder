json.array!(@items) do |product|
  json.extract! item, :name, :price
  json.url item_url(item, format: :json)
end
