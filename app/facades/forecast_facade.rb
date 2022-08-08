class ForecastFacade 
  def self.get_forecast(lat, lng)
    forecast = ForecastService.find_forecast(lat, lng)
    Forecast.new(forecast)
  end

  def self.forecast_summary(lat, lng)
    forecast = ForecastService.find_forecast(lat, lng)
    ShortForecast.new(forecast)
  end
end