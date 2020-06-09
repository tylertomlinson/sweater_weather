class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    user.save ? success(user) : failure(user)
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def success(user)
    render json: UserSerializer.new(user), status: :created
  end

  def failure(user)
    msg = { body: user.errors.full_messages.to_sentence, status: 400 }
    render json: msg, status: :bad_request
  end
end
