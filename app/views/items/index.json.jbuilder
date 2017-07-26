json.array!(@items) do |item|
  json.extract! item, :name, :price
  json.url item_url(item, format: :json)
end
