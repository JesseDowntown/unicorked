json.array!(@wines) do |wine|
  json.extract! wine, :id, :brand, :grape_variety, :year, :picture, :rating, :description, :color, :bubbly
  json.url wine_url(wine, format: :json)
end
