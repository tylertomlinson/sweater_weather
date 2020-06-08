require 'rails_helper'

describe 'foodie request API' do
  it 'can return forecast data' do
    get '/api/v1/foodie?start=denver,co&end=pueblo,co&search=italian'
    data = JSON.parse(response.body, symbolize_names: true)
    expect(response).to be_successful
    expect(data)
  end
end
