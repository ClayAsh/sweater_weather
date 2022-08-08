require 'rails_helper'

RSpec.describe FoodFacade do 
  it 'creates poro for food', :vcr do 

    location = "Pueblo, CO"
    food = "Chinese Restaurant"
    restaurant = FoodFacade.get_restaurant(location, food)

    expect(restaurant.first).to be_a(Food)
    expect(restaurant.first.name).to eq("Wonderful Bistro")
    expect(restaurant.first.address).to eq(["4602 N Elizabeth St", "Ste 120", "Pueblo, CO 81008"])
  end
end