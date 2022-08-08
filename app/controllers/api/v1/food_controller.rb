class Api::V1::FoodController < ApplicationController

  def index 
    loc = LocationFacade.location_data(params[:location])
    forecast = ForecastFacade.forecast_summary(loc[:lat], loc[:lng])
    food = FoodFacade.get_restaurant(params[:location], params[:food]).first
    require 'pry'; binding.pry
    render json: FoodWeatherSerializer.new(forecast, food), status: :created
    # FoodFacade.get_food_weather(food, forecast)
  end
end