class HourForecast 
  attr_reader :time,
              :temperature,
              :conditions,
              :icon

  def initialize(attributes)
    @time        = to_datetime(attributes[:dt])
    @temperature = attributes[:temp]
    @conditions  = attributes[:weather].first[:description]
    @icon        = icon_path(attributes[:weather].first[:icon])
  end

  def to_datetime(seconds)
    Time.zone.at(seconds).strftime('%m/%d/%Y %H:%M:%S %z')
  end

  def icon_path(icon)
    "http://openweathermap.org/img/wn/#{icon}@2x.png"
  end
end 