require 'rails_helper'

describe 'Road trip request API', :vcr do
  it 'can take in road trip info and return travel time and arrival forecast', :vcr do
    user = create(:user)

    info = {
      origin: 'denver, co',
      destination: 'pueblo, co',
      api_key: user.api_key
    }
    post  '/api/v1/road_trip',
          params: info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(json_response[:origin]).to eq('denver, co')
    expect(json_response[:destination]).to eq('pueblo, co')
    expect(json_response[:travel_time]).to eq('1 hour 48 mins')
    expect(json_response[:arrival_forecast]).to_not be_empty
  end

  it 'will not take in road trip info without a valid API key' do
    info = {
      origin: 'denver, co',
      destination: 'pueblo, co'
    }
    post  '/api/v1/road_trip',
          params: info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to_not be_successful
    expect(response).to have_http_status(401)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq('Unauthorized, No road trip for you')
  end
end
