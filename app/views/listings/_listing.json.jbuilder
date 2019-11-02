json.extract! listing, :id, :title, :description, :chef_id, :location, :created_at, :updated_at
json.url listing_url(listing, format: :json)
