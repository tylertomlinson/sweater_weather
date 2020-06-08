require 'rails_helper'

RSpec.describe ZomatoService, :vcr do
  before(:each) do
    @hash = { city: 'Denver', state: 'CO' }

    @service = ZomatoService.new(@hash)
  end

  it 'exists' do
    expect(@service).to be_an_instance_of(ZomatoService)
  end

  it 'can get city id' do
    city_name = @service.cityname
    expect(city_name).to eq('Denver, CO')

    city_id = @service.city_id
    expect(city_id).to eq(305)
  end

  it 'can get restuarant name/address by end location' do
  end
end
