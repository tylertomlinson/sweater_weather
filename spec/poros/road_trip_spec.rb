require 'rails_helper'

describe RoadTrip, :vcr do
  before(:each) do
    @origin = 'denver, co'
    @destination = 'jacksonville, fl'
    @road_trip = RoadTrip.new(@origin, @destination)
  end

  it 'exists' do
    expect(@road_trip).to be_an_instance_of(RoadTrip)
  end

  it 'initializes_with_attributes' do
    expect(@road_trip.id).to eq(nil)
    expect(@road_trip.origin).to eq(@origin)
    expect(@road_trip.destination).to eq(@destination)
  end

  it 'can get travel time' do
    service = GoogleMatrixService.new.get_distance(@origin, @destination)
    hash_digging = service[:rows].first[:elements].first
    still_hash_digging = service[:rows].first[:elements].first[:duration].first[1]

    expect(service).to be_an_instance_of(Hash)
    expect(hash_digging).to have_key(:distance)
    expect(still_hash_digging).to eq('1 day 1 hour')
  end
end
