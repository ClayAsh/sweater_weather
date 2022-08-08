class FoodWeatherSerializer
  include JSONAPI::Serializer
  attributes :id,
             :type,
             :attributes,
             :restaurant

end