require 'rails_helper'

describe 'Forecast request API', :vcr do
  it 'can return forecast data' do
    get '/api/v1/forecast?location=denver,co'

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(json_response[:data][:attributes]).to have_key(:id)
    expect(json_response[:data][:attributes]).to have_key(:timezone)
    expect(json_response[:data][:attributes]).to have_key(:current)
    expect(json_response[:data][:attributes]).to have_key(:daily)
    expect(json_response[:data][:attributes]).to have_key(:hourly)
  end
end
