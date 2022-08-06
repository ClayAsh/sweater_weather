class Api::V1::ForecastController < ApplicationController 

  def index 
    loc = LocationFacade.location_data(params[:location])
    forecast = ForecastFacade.get_forecast(loc[:lat], loc[:lng])
    render json: ForecastSerializer.new(forecast), status: :created
  end
end