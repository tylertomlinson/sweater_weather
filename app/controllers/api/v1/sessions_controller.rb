class Api::V1::SessionsController < Api::V1::BaseController
  def create
    user = User.find_by(email: params[:email])
    user&.authenticate(params[:password]) ? login_success(user) : login_failure
  end
end
