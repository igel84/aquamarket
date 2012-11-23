class ProductAttributeTranslation < ActiveRecord::Base

 validates_presence_of :name
 validates :locale, uniqueness: { scope: :product_attribute_id }
 attr_accessible :name, :locale
 belongs_to :product_attribute
 after_initialize { self.locale ||= I18n.default_locale if new_record? }

 def locale_enum
   I18n.available_locales
 end
end
