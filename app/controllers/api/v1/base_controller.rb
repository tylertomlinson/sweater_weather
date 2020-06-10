class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end

  def login_success(user)
    render json: UsersSerializer.new(user), status: :ok
  end

  def login_failure
    msg = { body: 'The credentials entered are invalid', status: 400 }
    render json: msg, status: :bad_request
  end

  def reg_success(user)
    render json: UsersSerializer.new(user), status: :created
  end

  def reg_failure(user)
    msg = { body: user.errors.full_messages.to_sentence, status: 400 }
    render json: msg, status: :bad_request
  end

  def the_coords(_location)
    GeoCodeService.new.get_coords(params[:location])[:geometry][:location]
  end
end
