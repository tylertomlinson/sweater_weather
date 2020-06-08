require 'rails_helper'

describe Forecast do
  before(:each) do
    @data = JSON.parse(File.read('spec/fixtures/info/forecast_data.json'))
    @forecast = Forecast.new(@data)
  end

  it 'exists' do
    expect(@forecast).to be_an_instance_of(Forecast)
  end

  it 'initializes_with_attributes' do
    expect(@forecast.id).to eq(1)
    expect(@forecast.timezone).to eq(@data[:timezone])
    expect(@forecast.current).to eq(@data[:current])
    expect(@forecast.daily).to eq(@data[:daily])
    expect(@forecast.hourly).to eq(@data[:hourly])
  end
end
