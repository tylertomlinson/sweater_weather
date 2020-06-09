class Forecast
  attr_reader :id, :timezone, :current, :daily, :hourly

  def initialize(data)
    @timezone = data[:timezone]
    @current = data[:current]
    @daily = data[:daily]
    @hourly = data[:hourly]
  end
end
