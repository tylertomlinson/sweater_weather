require 'rails_helper'

describe 'Background request API', :vcr do
  it 'can return image' do
    get '/api/v1/backgrounds?location=denver,co'

    json_response = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(json_response[:data][:attributes]).to have_key(:image_url)
  end
end
