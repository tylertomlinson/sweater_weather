class Api::V1::ForecastController < Api::V1::BaseController
  def index
    coords = the_coords(params[:location])
    weather_data = WeatherService.new.get_weather_data(coords[:lat], coords[:lng])
    render json: ForecastSerializer.new(Forecast.new(weather_data))
  end
end
