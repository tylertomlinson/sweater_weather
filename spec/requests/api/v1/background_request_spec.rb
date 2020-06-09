require 'rails_helper'

describe 'background request API' do
  it 'can return image' do
    get '/api/v1/backgrounds?location=denver,co'

    background_img = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(background_img[:data][:attributes]).to have_key(:image_url)
  end
end
