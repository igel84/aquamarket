Golf::Application.routes.draw do


  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  mount Ckeditor::Engine => '/ckeditor'

  scope :path => "(:locale)", :shallow_path => "(:locale)" do
    root to: 'catalogs#index'
    resource :catalogs
  end

end
