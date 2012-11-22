class Article < ActiveRecord::Base
 attr_accessible :title, :body, :locale
 translates :title, :body

 class Translation
   attr_accessible :locale
 end

end
