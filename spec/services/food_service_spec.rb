require 'rails_helper'

RSpec.describe FoodService do 
  it 'establishes connection to return restaurant data', :vcr do 
    location = "Pueblo, CO"
    term = "Chinese Restaurant"

    result = FoodService.get_food_info(location, term)

    expect(result).to be_a(Hash)
    expect(result[:businesses][0]).to include(:id)
    expect(result[:businesses][0]).to include(:name)
    expect(result[:businesses][0]).to include(:location)
  end
end