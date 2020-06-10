class ImageService < BaseService
  def get_background_image(location)
    city = location.split(',').first
    response = conn('https://api.unsplash.com').get('/search/photos') do |f|
      f.params[:query] = city
      f.params[:client_id] = ENV['UNSPLASH_API']
    end
    json(response)[:results].first[:urls][:raw]
  end
end
