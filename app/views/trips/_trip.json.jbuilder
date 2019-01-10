json.extract! trip, :id, :start, :end, :length, :elo, :link, :created_at, :updated_at
json.url trip_url(trip, format: :json)
