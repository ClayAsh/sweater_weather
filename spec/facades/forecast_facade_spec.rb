require 'rails_helper'

RSpec.describe ForecastFacade do 
  it 'creates poro for forecast data', :vcr do 
    forecast = ForecastFacade.get_forecast(39.736406, -104.89527)
    expect(forecast).to be_a(Forecast)
  end
end