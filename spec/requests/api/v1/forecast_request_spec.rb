require 'rails_helper'

describe 'forecast request API' do
  it 'can return forecast data' do

    get '/api/v1/forecast?location=denver,co'

    forecast = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(forecast[:data][:attributes]).to have_key(:id)
    expect(forecast[:data][:attributes]).to have_key(:timezone)
    expect(forecast[:data][:attributes]).to have_key(:current)
    expect(forecast[:data][:attributes]).to have_key(:daily)
    expect(forecast[:data][:attributes]).to have_key(:hourly)
  end
end
