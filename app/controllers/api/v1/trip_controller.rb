class Api::V1::TripController < ApplicationController

  def create 
    if User.find_by(api_key: trip_params[:api_key])
      loc = LocationFacade.location_data(trip_params[:destination])
      weather_data = ForecastFacade.get_forecast(loc[:lat], loc[:lng])
      trip_weather = LocationFacade.direction_data(trip_params[:origin], trip_params[:destination], weather_data)
      render json: TripSerializer.create_trip(trip_params[:origin], trip_params[:destination], trip_weather)
    else  
      render json: {error: "Invalid API key"}, status: 401
    end 
  end

  private 

  def trip_params
    JSON.parse(request.raw_post, symbolize_names: true)
  end
end