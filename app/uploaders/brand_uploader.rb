# encoding: utf-8
class BrandUploader < CarrierWave::Uploader::Base

  include UploadImage

  version :thumb do
    process resize_to_fit: [50, 50]
  end

  version :small do
    process resize_to_fill: [95, 95]
  end

  version :normal do
    process resize_to_fill: [300, 100]
  end
  
end
