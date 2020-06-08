require 'rails_helper'

RSpec.describe ImageService, :vcr do
  it 'exists' do
    service = ImageService.new

    expect(service).to be_an_instance_of(ImageService)
  end
end
