class TripSerializer

  def self.create_trip(origin, destination, trip_weather)
    if trip_weather.travel_time.nil?
            {
        "data": {
          "id": "null",
          "type": "roadtrip",
          "attributes": {
            "start_city": origin,
            "end_city": destination,
            "travel_time": trip_weather.route_error
          }
        }
      }
    else 
          {
        "data": {
          "id": "null",
          "type": "roadtrip",
          "attributes": {
            "start_city": origin,
            "end_city": destination,
            "travel_time": trip_weather.travel_time,
            "weather_at_eta": {
              "temperature": trip_weather.trip_temperature,
              "conditions": trip_weather.trip_conditions
            }
          }
        }
      }
    end 
  end
end