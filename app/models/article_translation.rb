class ArticleTranslation < ActiveRecord::Base
 
 attr_accessible :title, :body, :locale, :article_id
 belongs_to :article
 after_initialize { self.locale ||= I18n.default_locale if new_record? }

 def locale_enum
   I18n.available_locales
 end

end
