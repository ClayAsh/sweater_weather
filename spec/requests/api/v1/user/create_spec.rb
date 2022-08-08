require 'rails_helper'

RSpec.describe "Users API endpoint" do 
  it 'can create a user', :vcr do 
    params = { 
                'email': 'email@email.com',
                'password': 'password',
                'password_confirmation': 'password'
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/users", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 201
    expect(result).to be_a Hash
    expect(result[:data]).to have_key(:id)
    expect(result[:data]).to have_key(:type)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:email)
    expect(result[:data][:attributes][:email]).to eq('email@email.com')
    expect(result[:data][:attributes]).to have_key(:api_key)
    expect(result[:data][:attributes]).to_not have_key(:password)
    expect(result[:data][:attributes]).to_not have_key(:password_digest)
  end 

  it 'can return error code if password do not match', :vcr do 
        params = { 
                'email': 'email@email.com',
                'password': 'pass',
                'password_confirmation': 'password'
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/users", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 400
    expect(result[:errors]).to eq("Email is taken or passwords do not match")
  end
end 