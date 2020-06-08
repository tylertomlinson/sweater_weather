class Foodie
  attr_reader :id, :forecast, :temp, :travel_time, :end_location
  def initialize(weather_data, travel_time, location)
    @id = 1
    @forecast = weather_data[:current][:weather].first[:description]
    @temp = weather_data[:current][:temp]
    @travel_time = travel_time
    @end_location = location
  end
end
