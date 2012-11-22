class ArticleTranslation < ActiveRecord::Base
 
 belongs_to :article
 
 def locale_enum
   I18n.available_locales
 end

end
