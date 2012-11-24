class MenuItem < ActiveRecord::Base
  attr_accessible :name, :depth, :lft, :parent_id, :rgt, :url, :menu_item_translations_attributes, :parent
  translates :name do
    validates :name, presence: true
  end
  has_many :menu_item_translations, dependent: :destroy
  accepts_nested_attributes_for :menu_item_translations, allow_destroy: true
  acts_as_nested_set# scope: :parent_id
  default_scope order('lft')

  class Translation
    attr_accessible :locale
  end

end
