# RailsAdmin config file. Generated on November 22, 2012 11:03
# See github.com/sferik/rails_admin for more informations

RailsAdmin.config do |config|

  config.authorize_with :cancan
  config.main_app_name = ['Golf', 'Admin']
  config.current_user_method { current_user } # auto-generated
  config.audit_with :history, 'User'

  # Or with a PaperTrail: (you need to install it first)
  # config.audit_with :paper_trail, 'User'

  # Display empty fields in show views:
  # config.compact_show_view = false

  config.default_items_per_page = 50
  config.excluded_models = ['Role', 'RoleUser', 'GritterNotice', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture']

  # Include specific models (exclude the others):
  # config.included_models = ['Article', 'ArticleTranslation', 'Ckeditor::Asset', 'Ckeditor::AttachmentFile', 'Ckeditor::Picture', 'GritterNotice', 'User']

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
