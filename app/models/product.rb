class Product < ActiveRecord::Base
  attr_accessible :product_id, :catalogue_section_id, :name, :preview, :description, :price, :discount_price, :quantity, :product_translations_attributes
  translates :name, :preview, :description do
    validates :name, presence: true
  end
  has_many :product_translations, dependent: :destroy
  belongs_to :catalogue_section
  accepts_nested_attributes_for :product_translations, allow_destroy: true
  validates :catalogue_section_id, presence: true

  class Translation
    attr_accessible :locale
  end
end
