require 'rails_helper'

RSpec.describe WeatherService, :vcr do
  it 'exists' do
    service = WeatherService.new

    expect(service).to be_an_instance_of(WeatherService)
  end

  it 'can get data on weather by location' do
    coordinates = { lat: 30.3321838, lon: -81.65565099999999 }
    weather = WeatherService.new.get_weather_data(coordinates[:lat], coordinates[:lon])

    expect(weather).to be_an_instance_of(Hash)
    expect(weather[:current]).to have_key(:sunrise)
    expect(weather[:current]).to have_key(:sunset)
    expect(weather[:current]).to have_key(:feels_like)
  end
end

#testing
