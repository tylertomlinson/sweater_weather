class Api::V1::BackgroundsController < ApplicationController
  def index
    render json: ImageSerializer.new(Image.new(params[:location]))
  end
end
