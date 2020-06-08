class Foodie
  attr_reader :id, :forecast, :temp, :travel_time, :end_location, :restaurant_name, :restaurant_location

  def initialize(weather_data, travel_time, location, restaurant)
    @forecast = weather_data[:current][:weather].first[:description]
    @temp = weather_data[:current][:temp]
    @travel_time = travel_time
    @end_location = location
    @restaurant_name = restaurant['restaurants'].first['restaurant']['name']
    @restaurant_location = restaurant['restaurants'].first['restaurant']['location']['address']
  end
end
