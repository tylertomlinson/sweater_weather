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
    expect(@road_trip.travel_time).to eq('1 day 1 hour')
  end

  it 'can get trip coordinates' do
    coords = { lat: 30.3321838, lng: -81.65565099999999 }
    expect(@road_trip.coords).to eq(coords)
  end

  it 'can get arrival forecast' do
    expect(@road_trip.arrival_forecast).to be_an_instance_of(String)
  end
end
