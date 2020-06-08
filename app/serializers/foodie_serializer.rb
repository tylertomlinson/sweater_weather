class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :forecast, :temp, :travel_time, :end_location, :restaurant_name, :restaurant_location
end
