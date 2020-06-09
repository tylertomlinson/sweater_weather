require 'rails_helper'

RSpec.describe ImageService, :vcr do
  it 'exists' do
    service = ImageService.new

    expect(service).to be_an_instance_of(ImageService)
  end

  it 'can get background image' do
    service = ImageService.new.get_background_image('denver, co')
    expect(service).to eq('https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE0MDg3OH0')
  end
end
