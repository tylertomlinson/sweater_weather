require 'rails_helper'

RSpec.describe ZomatoService, :vcr do
  it 'exists' do
    service = ZomatoService.new

    expect(service).to be_an_instance_of(ZomatoService)
  end

  it 'can get restuarant name by end location' do
  end
end
