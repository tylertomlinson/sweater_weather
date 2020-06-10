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

  def arrival_forecast
    time = Time.current.hour + travel_time.to_i
    weather = WeatherService.new.get_weather_data(coords[:lat], coords[:lng])
    weather[:hourly][time][:weather].first[:description]
  end
end
