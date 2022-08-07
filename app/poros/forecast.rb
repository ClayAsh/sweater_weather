class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather,
              :id,
              :type

  def initialize(attributes)
    @id              = nil
    @type            = "forecast"
    @current_weather = current(attributes[:current])
    @daily_weather   = daily(attributes[:daily])
    @hourly_weather  = hourly(attributes[:hourly])
  end

  def current(attributes)
    CurrentForecast.new(attributes)
  end

  def daily(days)
    days.first(5).map do |day|
      DayForecast.new(day)
    end
  end

  def hourly(hours)
    hours.first(8).map do |hour|
      HourForecast.new(hour)
    end
  end
end 