class Foodie
  attr_reader :id, :forecast, :temp
  def initialize(data)
    @id = 1
    @forecast = data[:current][:weather].first[:description]
    @temp = data[:current][:temp]
  end

  def weather_data
  end
end
