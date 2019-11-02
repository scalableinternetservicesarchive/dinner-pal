json.extract! reservation, :id, :listing_id, :diner_id, :start_time, :end_time, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
