class Forecast
  attr_reader :id,
              :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon,
              :daily_weather,
              :hourly_weather

  def initialize(attributes)
    @id = nil
    @datetime = to_datetime(attributes[:current][:dt])
    @sunrise = to_datetime(attributes[:current][:sunrise])
    @sunset = to_datetime(attributes[:current][:sunset])
    @temperature = to_fahrenheit(attributes[:current][:temp])
    @feels_like = to_fahrenheit(attributes[:current][:feels_like])
    @humidity = attributes[:current][:humidity]
    @uvi = attributes[:current][:uvi]
    @visibility = attributes[:current][:visibility]
    @conditions = attributes[:current][:weather].first[:description]
    @icon = icon_path(attributes[:current][:weather].first[:icon])
    # @daily_weather = daily(attributes[:daily], 5)
    # @hourly_weather = hourly(attributes[:hourly], 8)
  end

  def to_datetime(seconds)
    Time.zone.at(seconds).strftime('%m/%d/%Y %H:%M:%S %z')
  end

  def to_fahrenheit(kelvin)
    ((kelvin - 273.15) * (9 / 5) + 32).round(1)
  end

  # def daily(days, num_days)
  #   days.first(days).map do |day|
  #     DayForecast.new(day)
  #   end
  # end

  # def hourly(hours, num_hours)
  #   hours.first(hours).map do |hour|
  #     HourForecast.new(hour)
  #   end
  # end

  def icon_path(icon)
    "http://openweathermap.org/img/wn/#{icon}@2x.png"
  end
end 