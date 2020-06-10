require 'rails_helper'

describe 'User login request API' do
  before(:each) do
    @user = create(:user)
    @user2 = create(:user)
  end

  it 'can successfully allow user to login' do
    user_info = {
      email: @user.email,
      password: @user.password,
      password_confirmation: @user.password_confirmation
    }
    post  '/api/v1/sessions',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to be_successful
    expect(response).to have_http_status(200)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:data][:attributes][:api_key]).to eq(@user.api_key)
    expect(json_response[:data][:attributes][:email]).to eq(@user.email)

    expect(json_response[:data][:attributes][:api_key]).to_not eq(@user2.api_key)
    expect(json_response[:data][:attributes][:email]).to_not eq(@user2.email)
  end

  it 'will not authenticate a user with invalid street cred (email)' do
    user_info = {
      email: 'test@gmail.com',
      password: @user.password,
      password_confirmation: @user.password_confirmation
    }
    post  '/api/v1/sessions',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to_not be_successful
    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq('The credentials entered are invalid')
    expect(json_response[:status]).to_not eq(201)
  end

  it 'will not authenticate a user with invalid street cred (password)' do
    user_info = {
      email: @user.email,
      password: '@user.password',
      password_confirmation: @user.password_confirmation
    }
    post  '/api/v1/sessions',
          params: user_info.to_json,
          headers: { 'Content-Type' => 'application/json', 'Accept' => 'application/json' }

    expect(response).to_not be_successful
    expect(response).to have_http_status(400)

    json_response = JSON.parse(response.body, symbolize_names: true)

    expect(json_response[:body]).to eq('The credentials entered are invalid')
    expect(json_response[:status]).to_not eq(201)
  end
end
