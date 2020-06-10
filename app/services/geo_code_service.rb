class GeoCodeService < BaseService
  def get_coords(location)
    response = conn('https://maps.googleapis.com').get('/maps/api/geocode/json') do |f|
      f.params['key'] = ENV['GOOGLE_API']
      f.params['address'] = location
    end
    json(response)[:results][0]
  end
end
