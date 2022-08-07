require 'rails_helper'

RSpec.describe Forecast do 
  it 'creates poro for forecast', :vcr do 
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)

    expect(forecast.id).to eq(nil)
    expect(forecast.type).to eq("forecast")
    expect(forecast.current_weather).to be_a(CurrentForecast)
    expect(forecast.hourly_weather.first).to be_a(HourForecast)
    expect(forecast.daily_weather.first).to be_a(DayForecast)
  end
end