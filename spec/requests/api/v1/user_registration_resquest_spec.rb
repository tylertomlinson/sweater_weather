require 'rails_helper'

describe 'User registration request API' do
  before(:each) do
    @sad_path_user = create(:user)
  end

  it 'can create user' do
    user_info = {
      email: 'test@example.com',
      password: 'test',
      password_confirmation: 'test'
    }

    post  '/api/v1/users',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to be_successful
    expect(response).to have_http_status(201)

    json_response = JSON.parse(response.body, symbolize_names: true)

    user = User.last

    expect(json_response[:data][:type]).to eq('users')
    expect(json_response[:data][:id]).to eq(user.id.to_s)
    expect(json_response[:data][:attributes][:email]).to eq('test@example.com')
    expect(json_response[:data][:attributes][:api_key]).to eq(user.api_key)

    expect(json_response[:data][:attributes][:email]).to_not eq(@sad_path_user.email)
    expect(json_response[:data][:attributes][:api_key]).to_not eq(@sad_path_user.api_key)
  end
end

describe 'User registration request API (errors)' do
  it 'will return status 400 with error msg if email is duplicate' do
    user1 = create(:user)
    user2_info = {
      email: user1.email,
      password: 'test',
      password_confirmation: 'test'
    }

    post  '/api/v1/users',
          params: user2_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq('Email has already been taken')
    expect(json_response[:status]).to eq(400)

    expect(json_response[:body]).to_not eq("Password confirmation doesn't match Password")
    expect(json_response[:body]).to_not eq(400)
  end

  it 'will return status 400 with error msg if passwords do not match' do
    user_info = {
      email: 'test@example.com',
      password: 'test',
      password_confirmation: 'test1'
    }

    post  '/api/v1/users',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq("Password confirmation doesn't match Password")
    expect(json_response[:status]).to eq(400)

    expect(json_response[:body]).to_not eq('Email has already been taken')
    expect(json_response[:body]).to_not eq(400)
  end

  it 'will return status 404 with error msg if passwords do not match (case sensitive)' do
    user_info = {
      email: 'test@example.com',
      password: 'tEST',
      password_confirmation: 'test'
    }

    post  '/api/v1/users',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq("Password confirmation doesn't match Password")
    expect(json_response[:status]).to eq(400)

    expect(json_response[:body]).to_not eq('Email has already been taken')
    expect(json_response[:body]).to_not eq(400)
  end

  it 'will return status 404 with error msg if all fields are not filled in (email)' do
    user_info = {
      email: '',
      password: 'test',
      password_confirmation: 'test'
    }

    post  '/api/v1/users',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq("Email can't be blank")
    expect(json_response[:status]).to eq(400)
  end

  it 'will return status 404 with error msg if all fields are not filled in (password)' do
    user_info = {
      email: 'test@example.com',
      password: '',
      password_confirmation: 'test'
    }

    post  '/api/v1/users',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq("Password digest can't be blank and Password can't be blank")
    expect(json_response[:status]).to eq(400)

    expect(json_response[:body]).to_not eq('Email has already been taken')
    expect(json_response[:body]).to_not eq(400)
  end
end
