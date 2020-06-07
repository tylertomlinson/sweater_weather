require 'rails_helper'

RSpec.describe GeoCodeService, :vcr do
  it 'exists' do
    service = GeoCodeService.new

    expect(service).to be_an_instance_of(GeoCodeService)
  end

  it 'can get lat and long of given location' do
    location_input = GeoCodeService.get_coords('denver,co')

    expect(location_input.count).to eq(5)
    expect(location_input).to be_an_instance_of(Hash)

    expect(location_input[:geometry][:location][:lat]).to eq(39.7392358)
    expect(location_input[:geometry][:location][:lng]).to eq(-104.990251)

    location_input = GeoCodeService.get_coords('jacksonville,fl')

    expect(location_input[:geometry][:location][:lat]).to eq(30.3321838)
    expect(location_input[:geometry][:location][:lng]).to eq(-81.65565099999999)
  end

  it 'returns nil for invalid search' do
    location_input = GeoCodeService.get_coords('abcd,ef')

    expect(location_input).to be_nil
  end
end
