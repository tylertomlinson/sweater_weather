class ImageService
  def get_background_image(location)
    city = location.split(',').first
    response = conn.get('/search/photos') do |f|
      f.params[:query] = city
      f.params[:client_id] = ENV['UNSPLASH_API']
    end
    JSON.parse(response.body, symbolize_names: true)[:results].first[:urls][:raw]
  end

  private

  def conn
    Faraday.new('https://api.unsplash.com')
  end
end
