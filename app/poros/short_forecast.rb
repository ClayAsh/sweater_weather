class ShortForecast
  attr_reader :summary,
              :temperature 
  def initialize(attributes)
    @summary = attributes[:current][:weather].first[:description]
    @temperature = attributes[:current][:temp]
  end
end