require 'rails_helper'

RSpec.describe "Sessions API endpoint" do 
  it 'can create trip for a user with good api key', :vcr do 
    user = User.create({email: 'someone@some.com', password: 'password'})
    params = { 
                'origin': "Denver,CO",
                'destination': "Pueblo,CO",
                'api_key': user.api_key
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/road_trip", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(result).to be_a Hash
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq("null")
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq("roadtrip")
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:start_city)
    expect(result[:data][:attributes][:start_city]).to eq("Denver,CO")
    expect(result[:data][:attributes]).to have_key(:end_city)
    expect(result[:data][:attributes][:end_city]).to eq("Pueblo,CO")
    expect(result[:data][:attributes]).to have_key(:travel_time)
    expect(result[:data][:attributes]).to have_key(:weather_at_eta)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
    expect(result[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
    expect(result[:data][:attributes]).to_not have_key(:travel_hours)
    expect(result[:data][:attributes]).to_not have_key(:route_error)
    expect(result[:data][:attributes]).to_not have_key(:trip_weather)
  end 

  it 'can create return error for bad api key', :vcr do 
    User.create({email: 'someone@some.com', password: 'password'})
    params = { 
                'origin': "Denver,CO",
                'destination': "Pueblo,CO",
                'api_key': "gobblygook"
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/road_trip", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 401
    expect(result[:error]).to eq("Invalid API key")
  end 

  it 'can return impossible route', :vcr do 
    user = User.create({email: 'someone@some.com', password: 'password'})
    params = { 
                'origin': "New York, NY",
                'destination': "London, UK",
                'api_key': user.api_key
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/road_trip", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(response.status).to eq 200
    expect(result).to be_a Hash
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq("null")
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq("roadtrip")
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:start_city)
    expect(result[:data][:attributes][:start_city]).to eq("New York, NY")
    expect(result[:data][:attributes]).to have_key(:end_city)
    expect(result[:data][:attributes][:end_city]).to eq("London, UK")
    expect(result[:data][:attributes]).to have_key(:travel_time)
    expect(result[:data][:attributes][:travel_time]).to eq("Impossible")
    expect(result[:data][:attributes]).to_not have_key(:weather_at_eta)
  end 
end 