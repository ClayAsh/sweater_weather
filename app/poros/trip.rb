class Trip 
  attr_reader :travel_time,
              :travel_hours,
              :route_error,
              :weather_data,
              :trip_weather,
              :trip_conditions,
              :trip_temperature

  def initialize(directions, weather_data)
    @travel_time = directions[:route][:formattedTime]
    @travel_hours = directions[:route][:formattedTime].to_i
    @route_error = "Impossible"
    @weather_data = weather_data
    @trip_weather = weather_at_eta
    @trip_conditions = @trip_weather.conditions 
    @trip_temperature = @trip_weather.temperature 
  end

  def weather_at_eta
    if @travel_hours <= 24
      @weather_data.long_hour_weather[@travel_hours - 1]
    else
      @weather_data.long_day_weather[@travel_hours - 1]
    end
  end
end