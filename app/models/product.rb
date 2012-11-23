class Product < ActiveRecord::Base
  attr_accessible :product_id, :catalogue_section_id, :art, :name, :preview, :description, :price, :discount_price, :quantity, :product_translations_attributes, :product_images_attributes, :product_attributes_attributes
  translates :name, :preview, :description do
    validates :name, presence: true
  end
  has_many :product_translations, dependent: :destroy
  has_many :product_images, dependent: :destroy
  has_many :product_attributes, dependent: :destroy
  belongs_to :catalogue_section
  accepts_nested_attributes_for :product_translations, allow_destroy: true
  accepts_nested_attributes_for :product_images, allow_destroy: true
  accepts_nested_attributes_for :product_attributes, allow_destroy: true
  validates :catalogue_section_id, presence: true

  class Translation
    attr_accessible :locale
  end
end
