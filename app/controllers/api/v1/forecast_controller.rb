class Api::V1::ForecastController < ApplicationController
  def index
    coords = the_coords(params[:location])
    weather_data = WeatherService.new.get_weather_data(coords[:lat], coords[:lng])
    render json: ForecastSerializer.new(Forecast.new(weather_data))
  end
end

private

def the_coords(_location)
  GeoCodeService.new.get_coords(params[:location])[:geometry][:location]
end
