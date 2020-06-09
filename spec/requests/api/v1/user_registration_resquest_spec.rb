require 'rails_helper'

describe 'User request API' do
  it 'can create user' do
    user_info = { email: 'test@example.com',
                  password: 'test',
                  password_confirmation: 'test' }

    post '/api/v1/users',
    params: user_info.to_json,
    headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json_response = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(json_response[:data][:type]).to eq('users')
    expect(json_response[:data][:id]).to eq(user.id.to_s)
    expect(json_response[:data][:attributes][:email]).to eq('test@example.com')
    expect(json_response[:data][:attributes][:api_key]).to eq(user.api_key)
  end
end
