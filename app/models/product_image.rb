class ProductImage < ActiveRecord::Base
  attr_accessible :image, :image_cache, :remove_image
  belongs_to :product
  validates :product_id, presence: true
  mount_uploader :image, ProductUploader
end
