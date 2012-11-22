RailsAdmin.config do |config|

  config.yell_for_non_accessible_fields = false
  config.authorize_with :cancan
  config.main_app_name = ['Golf', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.audit_with :history, 'User'
  config.default_items_per_page = 50
  config.excluded_models = ['Role', 'RoleUser', 'GritterNotice', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

#  config.included_models = ['Article', 'User']

  config.label_methods << :email

  config.model 'Article' do
      configure :article_translations, :has_many_association
      configure :id, :integer 
      configure :title, :string
      configure :created_at, :datetime 
      configure :updated_at, :datetime 
      list do; end
      show do; end
      edit do
        field :title
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
        field :article
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

end
