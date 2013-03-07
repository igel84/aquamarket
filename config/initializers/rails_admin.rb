#encoding: utf-8
RailsAdmin.config do |config|

  config.yell_for_non_accessible_fields = false
  #config.authorize_with :cancan
  
  config.authorize_with{
    redirect_to main_app.root_path, :alert => "Вы не обладаете достаточными правами для доступа к данной странице" unless current_user && current_user.role?(:admin)
  }

  config.main_app_name = ['Aquamarket', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.audit_with :history, 'User'
  config.default_items_per_page = 50
  config.excluded_models = ['Role', 'RoleUser', 'GritterNotice', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

#  config.included_models = ['Article', 'User']

  [:email, :locale].each{ |attr| config.label_methods << attr }

  config.model 'Article' do
      configure :id, :integer 
      configure :name, :string      
      configure :title, :string
      configure :body, :text
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :title        
      end
      show do; end
      edit do
        field :name
        field :title
        field :body do
          ckeditor do 
            true
          end
        end        
      end
      export do; end
  end

  config.model 'News' do
      configure :id, :integer 
      configure :title, :string
      configure :body, :text
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :title        
      end
      show do; end
      edit do
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
      configure :products, :has_many_association
      configure :id, :integer 
      configure :name, :string
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do
        field :name        
      end
      show do; end
      edit do
        field :name        
        field :products
        field :body do
        ckeditor do 
          true
        end
      end
      end
      export do; end
  end
  
  config.model 'Product' do    
    configure :product_images, :has_many_association
    configure :product_types, :has_many_association

    #configure :product_attributes, :enum
    configure :catalogue_section, :belongs_to_association
    configure :brand, :belongs_to_association
    configure :id, :integer     
    configure :name, :string
    #configure :preview, :text
    configure :description, :text
    configure :price, :decimal
    #configure :discount_price, :decimal
    #configure :quantity, :integer
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name      
      field :catalogue_section
      field :price
      #field :product_images
    end
    show do; end
    edit do
      field :catalogue_section
      field :brand
      field :name do
        length do
          255
        end
      end
      field :price
      #field :discount_price
      #field :quantity
      #field :preview do
      #  ckeditor do 
      #    true
      #  end
      #end        
      field :description do
        ckeditor do 
          true
        end
      end
      field :product_types
      field :product_images
      #field :product_attributes      
    end
    export do; end
  end

  config.model 'Brand' do    
    configure :products, :has_many_association
    configure :id, :integer     
    configure :name, :string
    configure :url, :string
    configure :keywords, :string
    configure :info, :text
    configure :logo, :carrierwave
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name      
      field :logo
      field :info
      #field :product_images
    end
    show do; end
    edit do
      field :logo
      field :name do
        length do
          255
        end
      end
      field :keywords do
        length do
          255
        end
      end
      field :url do
        length do
          255
        end
      end
      field :info do
        ckeditor do 
          true
        end
      end
      field :products
    end
    export do; end
  end

  #config.model 'ProductType' do 
  #  visible false   
  #  configure :product, :belongs_to_association
  #  configure :product_type_images, :has_many_association
  #  configure :id, :integer   
  #  configure :product_id, :integer     
  #  configure :name, :string
  #  configure :price, :decimal
  #  configure :created_at, :datetime 
  #  configure :updated_at, :datetime 
  #  list do
  #    field :name      
  #    field :price
  #    field :product_type_images
  #  end
  #  show do; end
  #  edit do
  #    field :product
  #    field :name do
  #      length do
  #        255
  #      end
  #    end
  #    field :price
  #    field :product_type_images
  #  end
  #  export do; end
  #end

  config.model 'ProductImage' do
    visible false
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

  #config.model 'ProductTypeImage' do
  #  visible false
  #    configure :product_type, :belongs_to_association
  #    configure :id, :integer 
  #    configure :type_image, :carrierwave
  #    configure :created_at, :datetime 
  #    configure :updated_at, :datetime 
  #    list do
  #      field :type_image
  #      field :product_type
  #    end
  #    show do; end
  #    edit do
  #      field :product_type do
  #        hide
  #      end
  #      field :type_image
  #    end
  #    export do; end
  #end

  config.model 'ProductAttribute' do    
    visible false

    configure :id, :integer 
    configure :name, :string
    configure :value, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      field :name
      field :value      
    end
    show do; end
    edit do
      field :name do
        length do
          255
        end
      end
      field :value      
    end
    export do; end
  end

  config.model 'MenuItem' do
    configure :id, :integer 
    configure :parent, :belongs_to_association
    configure :children, :has_many_association
    configure :lft, :integer
    configure :rgt, :integer
    configure :depth, :integer
    configure :name, :string
    configure :url, :string
    configure :created_at, :datetime 
    configure :updated_at, :datetime 
    list do
      sort_by :lft
      sort_reverse false
    
      field :name
      field :url      
      field :parent
      field :up, :string do
        label "up"
        formatted_value do
          o = bindings[:object]
          v = bindings[:view]
          url = v.main_app.menu_items_up_path(o.id)
          v.link_to("&#8593;".html_safe,url)
        end
      end  
      field :down, :string do
        label "down"
        formatted_value do
          o = bindings[:object]
          v = bindings[:view]
          url = v.main_app.menu_items_down_path(o.id)
          v.link_to("&#8595;".html_safe,url)
        end
      end        
    end
    show do; end
    edit do
      field :parent
      field :name do
        length do
          255
        end
      end
      field :name
      field :url      
    end
    export do; end
  end
end
