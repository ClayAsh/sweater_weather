require 'rails_helper'

RSpec.describe Trip do 
  it 'exists and has attributes', :vcr do 
    from = "Denver, CO"
    to = "Pueblo, CO"
    weather_data = ForecastFacade.get_forecast(39.736406, -104.89527)
    dir_results = LocationFacade.direction_data(from, to, weather_data)

    expect(dir_results.travel_time).to eq("01:45:23")
    expect(dir_results.trip_conditions).to eq("scattered clouds")
    expect(dir_results.trip_temperature).to eq(81.23)
  end

  it 'has error message for impossible route', :vcr do 
    from = "Denver, CO"
    to = "London, UK"
    weather_data = ForecastFacade.get_forecast(39.736406, -104.89527)
    dir_results = LocationFacade.direction_data(from, to, weather_data)

    expect(dir_results.route_error).to eq("Impossible")
  end

  it 'can format data correctly for day trips', :vcr do 
    from = "New York, NY"
    to = "Panama City, Panama"
    loc = LocationFacade.location_data(to)
    weather_data = ForecastFacade.get_forecast(loc[:lat], loc[:lng])
    dir_results = LocationFacade.direction_data(from, to, weather_data)

    expect(dir_results.travel_time).to eq("80:04:20")

    expect(dir_results.travel_hours).to eq(80)
  end
end