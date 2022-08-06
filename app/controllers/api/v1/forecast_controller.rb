class Api::V1::ForecastController < ApplicationController 

  def index 
    loc = LocationFacade.location_data(parama[[:location]])
    forecast = ForecastFacade.get_forecast(loc[:lat], loc[:lng])
    render json: ForecastSerializer.create_forecast(forecast), status: :created
  end
end