require 'rails_helper'

RSpec.describe ForecastService do 
  it 'establishes connection to get forecast', :vcr do 
    forecast = ForecastService.find_forecast(39.736406, -104.89527)

    expect(forecast).to be_a(Hash)
  end
end