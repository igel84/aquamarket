class ProductTypeImage < ActiveRecord::Base
  attr_accessible :type_image, :type_image_cache, :remove_type_image
  belongs_to :product_type
  mount_uploader :type_image, ProductTypeUploader
end
