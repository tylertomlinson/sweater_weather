class GoogleMatrixService < BaseService
  def get_distance(origin, destination)
    response = conn('https://maps.googleapis.com').get('/maps/api/distancematrix/json') do |f|
      f.params['key'] = ENV['GOOGLE_API']
      f.params['origins'] = origin
      f.params['destinations'] = destination
      f.params['units'] = 'imperial'
    end
    json(response)
  end
end
