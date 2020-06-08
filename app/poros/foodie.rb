class Foodie
  attr_reader :id, :forecast, :temp
  def initialize(weather_data, travel_time)
    @id = 1
    @forecast = weather_data[:current][:weather].first[:description]
    @temp = weather_data[:current][:temp]
    @travel_time
  end
end
