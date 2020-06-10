class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.new(user_params)
    user.save ? reg_success(user) : reg_failure(user)
  end
end
