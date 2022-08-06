require 'rails_helper'

RSpec.describe LocationFacade do 
  it 'returns json location results', :vcr do 
    location = '1237 Tamarac st Denver CO'
    loc_results = LocationFacade.location_data(location)
    expect(loc_results).to have_key(:lat)
    expect(loc_results).to have_key(:lng)
  end
end