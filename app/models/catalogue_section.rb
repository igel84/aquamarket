class CatalogueSection < ActiveRecord::Base
  attr_accessible :name, :catalogue_section_translations_attributes, :products_attributes
  translates :name do
    validates :name, presence: true
  end
  has_many :catalogue_section_translations, dependent: :destroy
  has_many :products, dependent: :destroy
  accepts_nested_attributes_for :catalogue_section_translations, allow_destroy: true
  accepts_nested_attributes_for :products, allow_destroy: true

  class Translation
    attr_accessible :locale
  end

end
