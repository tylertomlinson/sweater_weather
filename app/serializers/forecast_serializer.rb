class ForecastSerializer
  include FastJsonapi::ObjectSerializer
    attributes :id, :timezone, :current, :daily, :hourly
end
