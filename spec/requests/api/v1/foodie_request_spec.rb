require 'rails_helper'

describe 'foodie request API' do
  it 'can return forecast data' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'
    json = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(json[:data][:attributes]).to have_key(:forecast)
    expect(json[:data][:attributes]).to have_key(:temp)
    expect(json[:data][:attributes]).to have_key(:travel_time)
    expect(json[:data][:attributes]).to have_key(:end_location)
  end
end
