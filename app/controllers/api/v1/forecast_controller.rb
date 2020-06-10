class Api::V1::ForecastController < Api::V1::BaseController
  def index
    render json: ForecastSerializer.new(Forecast.new(weather_data))
  end

  private

  def coords
    the_coords(params[:location])
  end

  def weather_data
    WeatherService.new.get_weather_data(coords[:lat], coords[:lng])
  end
end
