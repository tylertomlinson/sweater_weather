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

    expect(json_response[:data][:type]).to eq('user')
    expect(json_response[:data][:id]).to eq(user.id.to_s)
    expect(json_response[:data][:attributes][:email]).to eq('test@example.com')
    expect(json_response[:data][:attributes][:api_key]).to eq(user.api_key)
  end

  it 'will return status 400 if email is duplicate' do
    user1 = create(:user)
    user2_info = { email: user1.email,
                  password: 'test',
                  password_confirmation: 'test' }

    post '/api/v1/users',
    params: user2_info.to_json,
    headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response.status).to eq(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq('Email has already been taken')
    expect(json_response[:status]).to eq(400)
  end

  it 'will return status 400 if passwords do not match' do
    user_info = { email: 'test@example.com',
                  password: 'test',
                  password_confirmation: 'test1' }

    post '/api/v1/users',
    params: user_info.to_json,
    headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response.status).to eq(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq("Password confirmation doesn't match Password")
    expect(json_response[:status]).to eq(400)
  end

end
