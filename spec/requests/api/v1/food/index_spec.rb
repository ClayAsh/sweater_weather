require 'rails_helper'

RSpec.describe "Food Weather Serializer" do 
  it 'returns restaurant and weather info for restaurant', :vcr do 
    location = "Pueblo CO"
    food = "Chinese Restaurant"
    get "/api/v1/munchies?location=#{location}&food=#{food}"

    expect(response).to be_successful 

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to be_a(Hash)
    expect(result).to have_key(:data)
    expect(result[:data]).to have_key(:id)
    expect(result[:data][:id]).to eq("null")
    expect(result[:data]).to have_key(:type)
    expect(result[:data][:type]).to eq("munchie")
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:destination_city)
    expect(result[:data][:attributes]).to have_key(:forecast)
    expect(result[:data][:attributes]).to have_key(:restaurant)

    expect(result[:data][:attributes][:forecast]).to have_key(:summary)
    expect(result[:data][:attributes][:forecast]).to have_key(:temperature)

    expect(result[:data][:attributes][:restaurant]).to have_key(:name)
    expect(result[:data][:attributes][:restaurant]).to have_key(:address)


  end
end