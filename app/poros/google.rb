class Google
  def initialize(origin, destination)
    @origin = origin
    @destination = destination
  end

  def travel_time
    hash = GoogleService.get_directions(@origin, @destination)
    hash[:rows].first[:elements].first[:duration].first[1]
  end
end
