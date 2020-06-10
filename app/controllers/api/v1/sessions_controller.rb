class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    user && user.authenticate(params[:password]) ? success(user) : failure
  end

private

  def success(user)
    render json: UserSerializer.new(user), status: 200
  end

  def failure
    msg = { body: 'The credentials entered are invalid', status: 400 }
    render json: msg, status: :bad_request
  end
end
