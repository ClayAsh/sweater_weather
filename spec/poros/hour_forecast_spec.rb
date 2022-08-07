require 'rails_helper'

RSpec.describe HourForecast do 
  it 'creates poro for hourly forecast', :vcr do
     forecast = ForecastFacade.get_forecast(39.736406, -104.89527)
     hour_forecast = forecast.hourly_weather

     expect(hour_forecast.first).to be_a(HourForecast)
     expect(hour_forecast.first.icon).to eq("http://openweathermap.org/img/wn/10d@2x.png")
  end
end