class FoodWeatherSerializer

  def self.food_weather(forecast, food)
      {
      "data": {
        "id": "null",
        "type": "munchie",
        "attributes": {
          "destination_city": "#{food.city}, #{food.state}",
          "forecast": {
            "summary": forecast.summary,
            "temperature": forecast.temperature
          },
          "restaurant": {
            "name": food.name,
            "address": food.address
          }
        }
      }
    }
  end 
end