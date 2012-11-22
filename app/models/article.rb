class Article < ActiveRecord::Base

  attr_accessible :title, :body, :article_translations_attributes
  translates :title, :body do
    validates :title, presence: true
  end
  has_many :article_translations, dependent: :destroy
  accepts_nested_attributes_for :article_translations, allow_destroy: true

  class Translation
    attr_accessible :locale
  end

end
