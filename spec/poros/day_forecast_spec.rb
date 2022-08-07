require 'rails_helper'

RSpec.describe DayForecast do 
  it 'creates poro for dat forecast', :vcr do 
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)
     day_forecast = forecast.daily_weather

     expect(day_forecast.first).to be_a(DayForecast)
     expect(day_forecast.first.icon).to eq("http://openweathermap.org/img/wn/10d@2x.png")
  end
end