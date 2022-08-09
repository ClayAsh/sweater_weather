class LocationService < BaseService

  def self.get_location_data(location)
    conn = Faraday.new(url: 'http://www.mapquestapi.com') do |f|
      f.params['key'] = ENV['map_key']
      f.params['location'] = location
    end
    response = conn.get('/geocoding/v1/address')
    get_json(response)
  end

  def self.get_directions(from, to)
    conn = Faraday.new(url: 'http://www.mapquestapi.com') do |f| 
      f.params['key'] = ENV['map_key']
      f.params['from'] = from
      f.params['to'] = to 
    end
    response = conn.get('/directions/v2/route')
    get_json(response)
  end
end