class ImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :image_url
end
