class Api::V1::ForecastController < Api::V1::BaseController
  def index
    render json: ForecastSerializer.new(Forecast.new(weather_data))
  end
end
