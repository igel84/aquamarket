class Product < ActiveRecord::Base

  attr_accessible :product_id, :catalogue_section_id, :art, :name, :preview, :description, :price, :discount_price, :quantity, :product_translations_attributes, :product_images_attributes, :product_attributes
  translates :name, :preview, :description do
    validates :name, presence: true
  end
  has_many :product_translations, dependent: :destroy
  has_many :product_images, dependent: :destroy
  belongs_to :catalogue_section
  accepts_nested_attributes_for :product_translations, allow_destroy: true
  accepts_nested_attributes_for :product_images, allow_destroy: true
  validates :catalogue_section_id, presence: true
  serialize :product_attributes, Array

  class Translation
    attr_accessible :locale
  end

  def product_attributes_enum
    ProductAttribute.all.collect{ |attr| [attr.name, attr.id] }
  end 

  def additional_attributes
    product_attributes.delete_at 0
    ProductAttribute.find(product_attributes.uniq)
  end
  
end
