class CurrentForecast
  attr_reader :datetime,
              :sunrise,
              :sunset,
              :temperature,
              :feels_like,
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon

  def initialize(attributes)
    @datetime    = to_datetime(attributes[:dt])
    @sunrise     = to_datetime(attributes[:sunrise])
    @sunset      = to_datetime(attributes[:sunset])
    @temperature = attributes[:temp]
    @feels_like  = attributes[:feels_like]
    @humidity    = attributes[:humidity]
    @uvi         = attributes[:uvi]
    @visibility  = attributes[:visibility]
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