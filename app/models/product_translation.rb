class ProductTranslation < ActiveRecord::Base
 
 validates_presence_of :title
 validates :locale, uniqueness: { scope: :product_id }
 attr_accessible :art, :name, :preview, :description, :price, :locale#, :product_id
 belongs_to :product
 after_initialize { self.locale ||= I18n.default_locale if new_record? }

 def locale_enum
   I18n.available_locales
 end

end
