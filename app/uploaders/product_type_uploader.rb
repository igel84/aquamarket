# encoding: utf-8
class ProductTypeUploader < CarrierWave::Uploader::Base

  include UploadImage

  version :box do
    process resize_to_fit: [50, 50]
  end

  version :thumb do
    process resize_to_fit: [128, 128]
  end

  version :small do
    process resize_to_fill: [200, 200]
  end

  version :medium do
    process resize_to_fit: [800, 800]
  end
  
end
