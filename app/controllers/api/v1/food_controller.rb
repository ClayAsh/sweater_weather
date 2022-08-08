class Api::V1::FoodController < ApplicationController

  def index 
    loc = LocationFacade.location_data(params[:location])
    forecast = ForecastFacade.get_forecast(loc[:lat], loc[:lng])
    food = FoodFacade.get_restaurant(loc, params[:food])
    render json: FoodWeatherSerializer.new(forecast, food), status: :created
    # FoodFacade.get_food_weather(food, forecast)
  end
end