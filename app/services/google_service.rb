class GoogleService
  def get_directions(origin, destination)
    response = conn.get('/maps/api/distancematrix/json') do |f|
      f.params['key'] = ENV['GOOGLE_GEO_API']
      f.params['origins'] = origin
      f.params['destinations'] = destination
      f.params['units'] = 'imperial'
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com')
  end
end
