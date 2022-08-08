class FoodService < BaseService 

  def self.get_food_info(location, food)
     conn = Faraday.new("https://api.yelp.com") do |f|
      f.params['location'] = location
      f.params['term'] = food 
      f.headers['Authorization'] = ENV["yelp_key"]
    end
    response = conn.get('/v3/businesses/search')
      get_json(response)
  end
end