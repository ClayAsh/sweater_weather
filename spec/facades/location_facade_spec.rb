require 'rails_helper'

RSpec.describe LocationFacade do 
  it 'returns json location results', :vcr do 
    location = '1237 Tamarac st Denver CO'
    loc_results = LocationFacade.location_data(location)
    expect(loc_results).to have_key(:lat)
    expect(loc_results).to have_key(:lng)
  end

  it 'creates poro for trip', :vcr do 
    from = "Denver, CO"
    to = "Pueblo, CO"
    
    weather_data = ForecastFacade.get_forecast(39.736406, -104.89527)
    dir_results = LocationFacade.direction_data(from, to, weather_data)
    expect(dir_results).to be_a(Trip)
  end
end