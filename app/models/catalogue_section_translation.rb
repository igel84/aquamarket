class CatalogueSectionTranslation < ActiveRecord::Base
 
  validates_presence_of :name
  validates :locale, uniqueness: { scope: :catalogue_section_id }
  attr_accessible :name, :locale
  belongs_to :catalogue_section
  after_initialize { self.locale ||= I18n.default_locale if new_record? }

  def locale_enum
    I18n.available_locales
  end

end
