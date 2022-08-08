require 'rails_helper'

RSpec.describe ForecastFacade do 
  it 'creates poro for forecast data', :vcr do 
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)
    expect(forecast).to be_a(Forecast)
  end

  it 'creates poro for forecast summary', :vcr do 
    short_for = ForecastFacade.forecast_summary(39.736406, -104.89527)

    expect(short_for).to be_a(ShortForecast)
  end
end