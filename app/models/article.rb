class Article < ActiveRecord::Base
 attr_accessible :title, :body, :article_translations
 translates :title, :body do
   validates :title, presence: true
 end
 has_many :article_translations
 accepts_nested_attributes_for :article_translations

 class Translation
   attr_accessible :locale
 end

end
