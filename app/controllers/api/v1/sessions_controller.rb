class Api::V1::SessionsController < ApplicationController

  def create 
    user = User.find_by(email: user_params[:email])
    if user&.authenticate(user_params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 201
    else 
      render json: { errors: 'Email or password is incorrect' }, status: 400
    end 
  end

  private

  def user_params
    JSON.parse(request.raw_post, symbolize_names: true)
  end
end