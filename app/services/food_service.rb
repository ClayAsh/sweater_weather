class FoodService < BaseService 

  def self.get_food_info(location, food)
     conn = Faraday.new("https://api.yelp.com") do |f|
      f.params['location'] = location
      f.params['term'] = food 
      f.headers['Authorization'] = "Bearer XGqz33dnJtBxK8DAH87cOb8HYq-zpKrmOqJ1x5trLNjyQrSwpYzvHOAnoxfOBmD2uZnOkhSwTa_jIPO_CpPxu03R4UBl00B9PRsCPuxVyNZO8kHAhV8L8F2PXyjxYnYx"
    end
    response = conn.get('/v3/businesses/search')
      get_json(response)
  end
end