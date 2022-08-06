class LocationFacade 
  def self.location_data(location)
    json = LocationService.get_location_data(location)
    json[:results][0][:locations][0][:latLng]
  end
end