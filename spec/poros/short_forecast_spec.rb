require 'rails_helper'

RSpec.describe ShortForecast do 
  it 'exists and has attributes', :vcr do 
    short_for = ForecastFacade.forecast_summary(39.736406, -104.89527)

    expect(short_for).to be_a(ShortForecast)
  end
end