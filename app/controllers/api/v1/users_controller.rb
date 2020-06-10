class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.new(user_params)
    user.save ? register_success(user) : register_failure(user)
  end
end
