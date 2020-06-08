require 'rails_helper'

describe Google do
  before(:each) do
    @origin = 'washington, dc'
    @destination = 'denver, co'
    @google = Google.new(@origin, @destination)
  end

  it 'exists' do
    expect(@google).to be_an_instance_of(Google)
  end

  it 'can return travel time' do
  end
end
