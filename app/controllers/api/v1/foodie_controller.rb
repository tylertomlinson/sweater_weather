class Api::V1::FoodieController < ApplicationController
  def index
    require "pry"; binding.pry
    coords = the_coords(params[:end])
    weather_data = WeatherService.new.get_weather_data(coords[:lat], coords[:lng])

    render json: 'text'
  end
end

def the_coords(_location)
  GeoCodeService.new.get_coords(params[:end])[:geometry][:location]
end
#want to use coordinates for zomato as well

def travel_time
  Google.new(params[:start], params[:end]).travel_time
end
