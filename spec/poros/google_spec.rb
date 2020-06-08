require 'rails_helper'

describe Google do
  before(:each) do
    @origin = 'washington, dc'
    @destination = 'denver, co'
    @google = Google.new(@origin, @destination)
  end

  it 'exists' do
    expect(@google).to be_an_instance_of(Google)
  end

  it 'can return travel time' do
    travel_time = @google.travel_time
    expect(travel_time).to eq("1 day 1 hour")
  end
end
