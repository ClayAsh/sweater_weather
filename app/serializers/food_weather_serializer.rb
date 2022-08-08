class FoodWeatherSerializer
  include JSONAPI::Serializer
  attributes :id,
             :type,
             :summary,
             :temperature,
             :name,
             :address

end