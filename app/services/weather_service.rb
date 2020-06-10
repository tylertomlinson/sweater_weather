class WeatherService < BaseService
  def get_weather_data(lat, lon)
    response = conn('https://api.openweathermap.org/').get('/data/2.5/onecall') do |f|
      f.params['appid'] = ENV['WEATHER_API']
      f.params['lat'] = lat
      f.params['lon'] = lon
      f.params['units'] = 'imperial'
    end
    json(response)
  end
end
