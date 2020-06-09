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
    render json: { status: 201, body: UserSerializer.new(user) }
  end

  def failure(user)
    render json: { status: 400, body: user.errors.full_messages.to_sentence}
  end

end
