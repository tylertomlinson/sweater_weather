class Api::V1::RoadTripController < Api::V1::BaseController
  def create
    user = User.find_by(api_key: params[:api_key])
    user ? road_trippin : trip_failure
  end
end
