require 'rails_helper'

RSpec.describe "Sessions API endpoint" do 
  it 'can log a user in' do 
    user = User.create({email: "email@email.com", password: "password", password_confirmation: "password"})
    params = { 
                'email': 'email@email.com',
                'password': 'password'
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/sessions", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response).to be_successful
    expect(response.status).to eq 201
    expect(result).to be_a Hash
    expect(result[:data][:id]).to eq(user.id.to_s)
    expect(result[:data]).to have_key(:type)
    expect(result[:data]).to have_key(:attributes)
    expect(result[:data][:attributes]).to have_key(:email)
    expect(result[:data][:attributes]).to have_key(:api_key)
    expect(result[:data][:attributes]).to_not have_key(:password)
  end

  it 'can return error message id password is incorrect' do 
    User.create({email: "email@email.com", password: "password", password_confirmation: "password"})
    params = { 
                'email': 'email@email.com',
                'password': 'pass'
              }
    headers = {
                "Content_Type": "application/json", 
                "Accept": "application/json"
              }

    post("/api/v1/sessions", headers: headers, params: params.to_json)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq 400
    expect(result[:errors]).to eq("Email or password is incorrect")
  end
end