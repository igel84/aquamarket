#encoding: utf-8
class Product < ActiveRecord::Base

  attr_accessible :product_id, :catalogue_section_id, :name, :preview, :description, :price, :discount_price, :quantity, :product_images_attributes, :product_attributes, :product_types_attributes
  
  has_many :product_images, dependent: :destroy
  belongs_to :catalogue_section

  has_many :order_items
  
  accepts_nested_attributes_for :product_images, allow_destroy: true
  validates :catalogue_section_id, presence: true
  serialize :product_attributes, Array
  
  has_many :product_types, dependent: :destroy
  accepts_nested_attributes_for :product_types, allow_destroy: true  

  def product_attributes_enum
    ProductAttribute.all.collect { |attr| ["#{attr.name}: #{attr.value}", attr.id] }
  end 

  def additional_attributes
    product_attributes.delete_if { |i| i.empty? }
    ProductAttribute.find(product_attributes.uniq)
  end
  
end
