class Api::V1::FoodieController < ApplicationController
  def index
    coords = the_coords(params[:end])
    location = params[:end]
    weather_data = WeatherService.new.get_weather_data(coords[:lat], coords[:lng])
    render json: FoodieSerializer.new(Foodie.new(weather_data, travel_time, location))
  end
end

def the_coords(_location)
  GeoCodeService.new.get_coords(params[:end])[:geometry][:location]
end
#want to use coordinates for zomato as well

def travel_time
  Google.new(params[:start], params[:end]).travel_time
end
#
#   "data": {
#     "id": "null",
#     "type": "foodie",
#     "attributes": {
#       "end_location": "pueblo,co",
#       "travel_time": "1 hours 48 min",
#       "forecast": {
#         "summary": "Cloudy with a chance of meatballs",
#         "temperature": "83"
#       },
#       "restaurant": {
#         "name": "Angelo's Pizza Parlor",
#         "address": "105 E Riverwalk, Pueblo 81003"
#       }
#     }
#   }
# }
# PAW RESPONSE
# {
#   "data": {
#     "id": "1",
#     "type": "foodie",
#     "attributes": {
#       "id": 1,
#       "forecast": "clear sky",
#       "temp": 79.16,
#       "travel_time": "1 hour 48 mins",
#       "end_location": "pueblo,co"
#     }
#   }
# }
