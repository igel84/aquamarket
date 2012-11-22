Golf::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  scope "(:locale)", locale: /en|ru/ do
    root to: 'catalogs#index'
    resources :catalogs
  end

end
