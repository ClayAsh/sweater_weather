require 'rails_helper'

RSpec.describe CurrentForecast do 
  it 'creates poro for current forecast', :vcr do
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)
    current_weather = forecast.current_weather

    expect(current_weather).to be_a(CurrentForecast)
    expect(current_weather.icon).to eq("http://openweathermap.org/img/wn/04d@2x.png")
  end 

end