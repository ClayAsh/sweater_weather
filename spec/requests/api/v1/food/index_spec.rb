require 'rails_helper'

RSpec.describe "Food Weather Serializer" do 
  it 'returns restaurant and weather info for restaurant', :vcr do 
    location = "Pueblo CO"
    food = "Chinese Restaurant"
    get "/api/v1/munchies?location=#{location},co&food=#{food}"

    expect(response).to be_successful 

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result).to be_a(Hash)
  end
end