json.array!(@items) do |item|
  json.extract! item, :id, :link, :title, :description, :date, :rss_url
  json.url item_url(item, format: :json)
end
