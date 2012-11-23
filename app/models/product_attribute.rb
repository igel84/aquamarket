class ProductAttribute < ActiveRecord::Base

  attr_accessible :name, :product_attribute_translations_attributes
  translates :name do
    validates :name, presence: true
  end
  has_many :product_attribute_translations, dependent: :destroy
  accepts_nested_attributes_for :product_attribute_translations, allow_destroy: true

  class Translation
    attr_accessible :locale
  end

end
