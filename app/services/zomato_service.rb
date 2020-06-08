class ZomatoService
  def initialize(search_params)
    @city = search_params
  end

  def restaurants_by_location
    city = city_id
    response = conn.get('search') do |search|
      search.params['entity_id'] = city
      search.params['entity_type'] = 'city'
      search.params['radius'] = '10'
      search.params['count'] = '1'
    end
    JSON.parse(response.body, serialize_names: true)
  end

  def city_id
    response = conn.get('cities') do |c|
      c.params['q'] = @city
      c.params['count'] = 1
    end
    json = JSON.parse(response.body, symbolize_names: true)
    json[:location_suggestions].first[:id]
  end

  def conn
    Faraday.new(url: 'https://developers.zomato.com/api/v2.1') do |f|
      f.headers['user-key'] = ENV['ZOMATO_API']
    end
  end
end
