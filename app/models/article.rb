class Article < ActiveRecord::Base
  attr_accessible :title, :body
  translates :title, :body
end
