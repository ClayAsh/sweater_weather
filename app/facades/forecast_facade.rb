class ForecastFacade 
  def self.get_forecast(lat, lng)
    forecast = ForecastService.find_forecast(lat, lng)
    Forecast.new(forecast)
  end
end