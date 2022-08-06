require 'rails_helper'

RSpec.describe Forecast do 
  it 'creates poro for forecast', :vcr do 
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)

    expect(forecast.sunrise).to eq("08/06/2022 12:03:17 +0000")
    expect(forecast.sunset).to eq("08/07/2022 02:07:39 +0000")
    expect(forecast.temperature).to eq(84.43)
    expect(forecast.icon).to eq("http://openweathermap.org/img/wn/11d@2x.png")
  end
end