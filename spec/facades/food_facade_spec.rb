require 'rails_helper'

RSpec.describe FoodFacade do 
  it 'creates poro for food', :vcr do 

    location = "Pueblo, CO"
    food = "Chinese Restaurant"
    restaurant = FoodFacade.get_restaurant(location, food)

    expect(restaurant).to be_a(Food)
  end
end