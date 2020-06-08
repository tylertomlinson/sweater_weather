class GeoCodeService
  def get_coords(location)
    response = conn.get('/maps/api/geocode/json') do |f|
      f.params['key'] = ENV['GOOGLE_API']
      f.params['address'] = location
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0]
  end

  private

  def conn
    Faraday.new('https://maps.googleapis.com')
  end
end
