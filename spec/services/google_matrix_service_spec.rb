require 'rails_helper'

RSpec.describe GoogleMatrixService, :vcr do
  it 'exists' do
    service = GoogleMatrixService.new

    expect(service).to be_an_instance_of(GoogleMatrixService)
  end

  it 'can get travel time' do
    origin = 'washington, dc'
    destination = 'denver, co'

    service = GoogleMatrixService.new.get_distance(origin, destination)
    hash_digging = service[:rows].first[:elements].first
    still_hash_digging = service[:rows].first[:elements].first[:duration].first[1]

    expect(service).to be_an_instance_of(Hash)
    expect(hash_digging).to have_key(:distance)
    expect(still_hash_digging).to eq('1 day 1 hour')
  end
end
