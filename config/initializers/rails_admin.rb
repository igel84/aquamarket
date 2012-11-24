RailsAdmin.config do |config|

  config.yell_for_non_accessible_fields = false
  config.authorize_with :cancan
  config.main_app_name = ['Golf', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.audit_with :history, 'User'
  config.default_items_per_page = 50
  config.excluded_models = ['Role', 'RoleUser', 'GritterNotice', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

#  config.included_models = ['Article', 'User']

  [:email, :locale].each{ |attr| config.label_methods << attr }

  config.model 'Article' do
      configure :article_translations, :has_many_association
      configure :id, :integer 
      configure :title, :string
      configure :body, :text
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :title
        field :article_translations
      end
      show do; end
      edit do
        field :title
        field :body do
          ckeditor do 
            true
          end
        end
        field :article_translations
      end
      export do; end
  end

  config.model 'ArticleTranslation' do
      configure :article, :belongs_to_association 
      configure :id, :integer 
      configure :article_id, :integer
      configure :locale, :enum 
      configure :title, :string 
      configure :body, :text 
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :locale
        field :title
        field :article
      end
      show do; end
      edit do
        field :article do
          hide
        end
        field :locale
        field :title
        field :body do
          ckeditor do 
            true
          end
        end
      end
      export do; end
   end

  config.model 'CatalogueSection' do
      configure :catalogue_section_translations, :has_many_association
      configure :products, :has_many_association
      configure :id, :integer 
      configure :name, :string
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :name
        field :catalogue_section_translations
      end
      show do; end
      edit do
        field :name
        field :catalogue_section_translations
        field :products
      end
      export do; end
  end

  config.model 'CatalogueSectionTranslation' do
     configure :catalogue_section, :belongs_to_association 
     configure :id, :integer 
     configure :catalogue_section_id, :integer
     configure :locale, :enum 
     configure :name, :string 
     configure :created_at, :datetime 
     configure :updated_at, :datetime 
     list do
       field :locale
       field :name
       field :catalogue_section
     end
     show do; end
     edit do
       field :catalogue_section do
         hide
       end
       field :locale
       field :name
     end
     export do; end
   end

  config.model 'Product' do
    configure :product_translations, :has_many_association
    configure :product_images, :has_many_association
    configure :product_attributes, :enum
    configure :catalogue_section, :belongs_to_association
    configure :id, :integer 
    configure :art, :string
    configure :name, :string
    configure :preview, :text
    configure :description, :text
    configure :price, :decimal
    configure :discount_price, :decimal
    configure :quantity, :integer
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :art
      field :name
      field :product_translations
      field :catalogue_section
      field :product_images
    end
    show do; end
    edit do
      field :catalogue_section
      field :art do
        length do
          255
        end
      end
      field :name do
        length do
          255
        end
      end
      field :price
      field :discount_price
      field :quantity
      field :preview
      field :description do
        ckeditor do 
          true
        end
      end
      field :product_images
      field :product_attributes
      field :product_translations
    end
    export do; end
  end

  config.model 'ProductTranslation' do
    configure :product, :belongs_to_association 
    configure :id, :integer 
    configure :product_id, :integer
    configure :locale, :enum 
    configure :name, :string 
    configure :preview, :text 
    configure :desctiption, :text
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :locale
      field :name
      field :product
    end
    show do; end
    edit do
      field :locale
      field :name
      field :preview
      field :description do
        ckeditor do 
          true
        end
      end
    end
    export do; end
  end

  config.model 'ProductImage' do
      configure :product, :belongs_to_association
      configure :id, :integer 
      configure :image, :carrierwave
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :image
        field :product
      end
      show do; end
      edit do
        field :product do
          hide
        end
        field :image
      end
      export do; end
  end

  config.model 'ProductAttribute' do
    configure :product_attribute_translations, :has_many_association
    configure :id, :integer 
    configure :name, :string
    configure :value, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name
      field :value
      field :product_attribute_translations
    end
    show do; end
    edit do
      field :name do
        length do
          255
        end
      end
      field :value
      field :product_attribute_translations
    end
    export do; end
  end

  config.model 'ProductAttributeTranslation' do
    configure :product_attribute, :belongs_to_association 
    configure :id, :integer 
    configure :product_attribute_id, :integer
    configure :locale, :enum 
    configure :name, :string 
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :locale
      field :name
      field :product_attribute
    end
    show do; end
    edit do
      field :locale
      field :name
    end
    export do; end
  end

  config.model 'MenuItem' do
    configure :menu_items, :has_many_association
    configure :id, :integer 
    configure :parent_id, :integer
    configure :lft, :integer
    configure :rgt, :integer
    configure :depth, :integer
    configure :name, :string
    configure :url, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name
      field :url
      field :menu_item_translations
    end
    show do; end
    edit do
      field :name do
        length do
          255
        end
      end
      field :name
      field :url
      field :menu_item_translations
    end
    export do; end
  end

  config.model 'MenuItemTranslation' do
    configure :menu_item, :belongs_to_association 
    configure :id, :integer 
    configure :menu_item_id, :integer
    configure :locale, :enum 
    configure :name, :string 
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :locale
      field :name
      field :product_attribute
    end
    show do; end
    edit do
      field :locale
      field :name
    end
    export do; end
  end

end
