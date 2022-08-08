class Api::V1::UsersController < ApplicationController

  def create 
    user_create = User.new(user_params)
    if user_create.save
    session[:id] = user_create[:id]
    render json: UserSerializer.new(user_create), status: 201
    else  
      render json: { errors: 'Email is taken or passwords do not match' }, status: 400
    end 
  end

  private 

  def user_params 
    JSON.parse(request.body.read, symbolize_names: true)
  end
end