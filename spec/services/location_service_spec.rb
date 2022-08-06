require 'rails_helper'

RSpec.describe LocationService do 
  it 'establishes connection to get location data', :vcr do 
    location = '1237 Tamarac st Denver CO'
    response = LocationService.get_location_data(location)

    expect(response).to be_a(Hash)
  end
end