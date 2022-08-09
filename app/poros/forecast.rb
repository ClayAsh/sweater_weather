class Forecast
  attr_reader :current_weather,
              :daily_weather,
              :hourly_weather,
              :id,
              :type,
              :long_day_weather,
              :long_hour_weather

  def initialize(attributes)
    @id              = nil
    @type            = "forecast"
    @current_weather = current(attributes[:current])
    @daily_weather   = daily(attributes[:daily])
    @hourly_weather  = hourly(attributes[:hourly])

    @long_day_weather = long_daily(attributes[:daily])
    @long_hour_weather = long_hourly(attributes[:hourly])
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

  def long_daily(days)
    days.map do |day|
      DayForecast.new(day)
    end
  end

  def long_hourly(hours)
    hours.map do |hour|
      HourForecast.new(hour)
    end
  end
end 