# require 'rails_helper'

# RSpec.describe FoodWeather do 
#   it 'exists and has attributes', :vcr do 
#     food = FoodFacade.get_restaurant("Pueblo, CO", "Chinese Restaurant")
#     loc = LocationFacade.location_data("Pueblo, CO")
#     forecast = ForecastFacade.get_forecast(loc[:lat], loc[:lng])
#     fw = FoodFacade.get_food_weather(food, forecast)

#     expect(fw).to be_a(FoodWeather)
#   end
# end