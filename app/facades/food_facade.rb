class FoodFacade 

  def self.get_restaurant(location, food)
    restaurant = FoodService.get_food_info(location, food)
    restaurant[:businesses].map do |f|
      Food.new(f)
    end
  end
end