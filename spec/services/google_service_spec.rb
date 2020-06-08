require 'rails_helper'

RSpec.describe GoogleService, :vcr do
  it 'exists' do
    service = GoogleService.new

    expect(service).to be_an_instance_of(GoogleService)
  end

  it 'can get travel time' do
    origin = 'washington, dc'
    destination = 'denver, co'
    service = GoogleService.new.get_directions(origin, destination)
    who_knows = service[:rows].first[:elements].first
    give_me_a_break_google = service[:rows].first[:elements].first[:duration].first[1]
    expect(service).to be_an_instance_of(Hash)
    expect(who_knows).to have_key(:distance)
    expect(give_me_a_break_google).to eq('1 day 1 hour')
  end
end
