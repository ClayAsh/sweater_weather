require 'rails_helper'

RSpec.describe FoodService do 
  it 'establishes connection to return restaurant data', :vcr do 
    location = "Pueblo, CO"
    categories = "Chinese Restaurant"

    result = FoodService.get_food_info(location, categories)

    expect(result).to be_a(Hash)
  end
end