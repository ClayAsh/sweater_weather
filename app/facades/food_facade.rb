class FoodFacade 

  def self.get_restaurant(location, food)
    FoodService.get_food_info(location, food)[:businesses].map do |f|
      require 'pry'; binding.pry
      Food.new(f)
    end
  end

  # def self.get_food_weather(food, forecast)

  # end
end