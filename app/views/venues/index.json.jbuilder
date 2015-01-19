json.array!(@venues) do |venue|
  json.extract! venue, :id, :status, :capacity, :name, :url, :short_address, :fbid, :email, :phone, :address, :lat, :checked, :lng, :original_id, :description
  json.url venue_url(venue, format: :json)
end
