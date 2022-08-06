class ForecastService < BaseService

  def self.find_forecast(lat, lng)
    conn = Faraday.new("http://api.openweathermap.org") do |f|
      f.params['appid'] = ENV['ow_key']
      f.params['lat'] = lat
      f.params['lon'] = lng
      f.params['units'] = 'imperial'
    end
    response = conn.get('/data/2.5/onecall')
    get_json(response)
  end
end 