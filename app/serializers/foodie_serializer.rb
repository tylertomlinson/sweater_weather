class FoodieSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :forecast, :temp, :travel_time, :end_location
end
