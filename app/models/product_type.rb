#encoding: utf-8
class ProductType < ActiveRecord::Base

  attr_accessible :product_id, :name, :price, :product_type_images_attributes
  has_many :product_type_images, dependent: :destroy  
  accepts_nested_attributes_for :product_type_images, allow_destroy: true
  belongs_to :product

  def full_name
    product.name + ' - ' + name    
  end
  
end
