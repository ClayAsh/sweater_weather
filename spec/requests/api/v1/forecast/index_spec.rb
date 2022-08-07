require 'rails_helper'

RSpec.describe "Mapquest and OpenWeather API forecast index" do 
  it 'returns current forecast for location', :vcr do 
    location = "Denver CO"

    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful 

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to be_a(Hash)
    expect(result[:data]).to have_key(:id)
    expect(result[:data]).to have_key(:type)

    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:id)
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:attributes]).to have_key(:current_weather)

    current_weather = result[:data][:attributes][:current_weather]

    expect(current_weather).to have_key(:datetime)
    expect(current_weather).to have_key(:sunrise)
    expect(current_weather).to have_key(:sunset)
    expect(current_weather).to have_key(:temperature)
    expect(current_weather).to have_key(:feels_like)
    expect(current_weather).to have_key(:humidity)
    expect(current_weather).to have_key(:uvi)
    expect(current_weather).to have_key(:visibility)
    expect(current_weather).to have_key(:conditions)
    expect(current_weather).to have_key(:icon)
    expect(current_weather).not_to have_key(:pressure)
    expect(current_weather).not_to have_key(:dew_point)
    expect(current_weather).not_to have_key(:clouds)
    expect(current_weather).not_to have_key(:wind_speed)
    expect(current_weather).not_to have_key(:wind_deg)
    expect(current_weather).not_to have_key(:wind_gust)
  end

  it 'returns daily forecast', :vcr do 
    location = "Denver CO"
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    days = result[:data][:attributes][:daily_weather]

    expect(days).to be_a(Array)
    expect(days.count).to eq(5)
    expect(days.first).to have_key(:sunrise)
    expect(days.first).to have_key(:sunset)
    expect(days.first).to have_key(:max_temp)
    expect(days.first).to have_key(:min_temp)
    expect(days.first).to have_key(:conditions)
    expect(days.first).to have_key(:icon)
    expect(days.first).not_to have_key(:moonrise)
    expect(days.first).not_to have_key(:moonset)
    expect(days.first).not_to have_key(:moon_phase)
    expect(days.first).not_to have_key(:feels_like)
    expect(days.first).not_to have_key(:pressure)
    expect(days.first).not_to have_key(:humidity)
    expect(days.first).not_to have_key(:dew_point)
    expect(days.first).not_to have_key(:wind_speed)
    expect(days.first).not_to have_key(:wind_deg)
    expect(days.first).not_to have_key(:wind_gust)
    expect(days.first).not_to have_key(:moonrise)
    expect(days.first).not_to have_key(:clouds)
    expect(days.first).not_to have_key(:pop)
    expect(days.first).not_to have_key(:uvi)
  end

  it 'returns hourly forecast', :vcr do 
    location = "Denver CO"
    get "/api/v1/forecast?location=#{location}"

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    hours = result[:data][:attributes][:hourly_weather]
    expect(hours).to be_a(Array)
    expect(hours.count).to eq(8)
    expect(hours.first).to have_key(:temperature)
    expect(hours.first).to have_key(:conditions)
    expect(hours.first).to have_key(:icon)
    expect(hours.first).not_to have_key(:feels_like)
    expect(hours.first).not_to have_key(:pressure)
    expect(hours.first).not_to have_key(:humidity)
    expect(hours.first).not_to have_key(:dew_point)
    expect(hours.first).not_to have_key(:uvi)
    expect(hours.first).not_to have_key(:clouds)
    expect(hours.first).not_to have_key(:visibility)
    expect(hours.first).not_to have_key(:wind_speed)
    expect(hours.first).not_to have_key(:wind_deg)
    expect(hours.first).not_to have_key(:wind_gust)
    expect(hours.first).not_to have_key(:pop)
  end
end