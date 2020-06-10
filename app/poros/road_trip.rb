class RoadTrip
  attr_reader :id, :origin, :destination

  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    hash = GoogleService.new.get_directions(@origin, @destination)
    hash[:rows].first[:elements].first[:duration].first[1]
  end

  def arrival_forecast
    (Time.now + travel_time).hour
  end
end
