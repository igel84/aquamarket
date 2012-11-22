class Article < ActiveRecord::Base
 attr_accessible :title, :body
 translates :title, :body
 accepts_nested_attributes_for :translations
end
