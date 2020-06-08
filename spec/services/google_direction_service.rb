require 'rails_helper'

RSpec.describe GoogleDirectionsService, :vcr do
  it 'exists' do
    service = GoogleDirectionsService.new

    expect(service).to be_an_instance_of(GoogleDirectionsService)
  end

  it 'can get travel time' do
  end
end
