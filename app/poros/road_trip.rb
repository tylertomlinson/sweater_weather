class RoadTrip
  attr_reader :id, :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    hash = GoogleMatrixService.new.get_distance(@origin, @destination)
    hash[:rows].first[:elements].first[:duration].first[1]
  end

  def coords
    GeoCodeService.new.get_coords(@destination)[:geometry][:location]
  end

  def arrival_conditions
    time = Time.current.hour + travel_time.to_i
    weather = WeatherService.new.get_weather_data(coords[:lat], coords[:lng])
    [weather[:hourly][time][:weather].first[:description],
    weather[:hourly][time][:temp]]
  end

  def arrival_forecast
    { temp: arrival_conditions[1], conditions: arrival_conditions[0] }
  end
end
