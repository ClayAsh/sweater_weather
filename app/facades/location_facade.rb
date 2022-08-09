class LocationFacade 
  def self.location_data(location)
    json = LocationService.get_location_data(location)
    json[:results][0][:locations][0][:latLng]
  end

  def self.direction_data(from, to, weather_data)
    directions = LocationService.get_directions(from, to) 
    Trip.new(directions, weather_data)
  end
end