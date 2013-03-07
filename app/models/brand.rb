class Brand < ActiveRecord::Base
  attr_accessible :info, :name, :logo, :logo_cache, :remove_logo, :url, :keywords, :products_attributes
  
  has_many :products
  accepts_nested_attributes_for :products, allow_destroy: true
  
  mount_uploader :logo, BrandUploader

end
