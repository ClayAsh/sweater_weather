require 'rails_helper'

RSpec.describe Forecast do 
  it 'creates poro for forecast', :vcr do 
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)
    expect(forecast.sunset).to eq("08/07/2022 02:07:39 +0000")
  end
end