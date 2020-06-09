class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if user.save
      success(user)
    else
      render json: failure(user), status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def success(user)
    render json: UserSerializer.new(user), status: 201
  end

  def failure(user)
    { body: user.errors.full_messages.to_sentence, status: 400 }
  end
end
