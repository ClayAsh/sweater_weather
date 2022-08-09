class DayForecast 
  attr_reader :date,
              :sunrise,
              :sunset,
              :max_temp,
              :min_temp,
              :conditions,
              :icon,
              :average_temp

  def initialize(attributes)
    @date       = to_date(attributes[:dt])
    @sunrise    = to_datetime(attributes[:sunrise])
    @sunset     = to_datetime(attributes[:sunset])
    @max_temp   = attributes[:temp][:max]
    @min_temp   = attributes[:temp][:min]
    @conditions = attributes[:weather].first[:description]
    @icon       = icon_path(attributes[:weather].first[:icon])
    @average_temp = average_temp_cal.round(2)
  end

  def average_temp_cal
    (@max_temp + @min_temp) / 2
  end

  def to_date(seconds)
    time = Time.zone.at(seconds).to_datetime
    time.strftime('%F')
  end

  def to_datetime(seconds)
    Time.zone.at(seconds).strftime('%m/%d/%Y %H:%M:%S %z')
  end

  def icon_path(icon)
    "http://openweathermap.org/img/wn/#{icon}@2x.png"
  end
end