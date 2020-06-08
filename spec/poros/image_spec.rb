require 'rails_helper'

describe Image, :vcr do 
  before(:each) do
    @location = 'denver, co'
    @image = Image.new(@location)
  end

  it 'exists' do
    expect(@image).to be_an_instance_of(Image)
  end

  it 'initializes_with_attributes' do
    expect(@image.id).to eq(nil)
    expect(@image.location).to eq(@location)
  end

  it 'can get image url' do
    url = @image.image_url
    expect(url).to eq('https://images.unsplash.com/photo-1546156929-a4c0ac411f47?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjE0MDg3OH0')
  end
end
