class Image
  attr_reader :id, :location

  def initialize(location)
    @location = location
  end

  def image_url
     ImageService.new.get_background_image(@location)
  end
end
