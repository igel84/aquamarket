Golf::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  post '/cart/add_to_cart', controller: :cart, action: :add_to_cart, as: 'add_to_cart'

  scope "(:locale)", locale: /en|ru/ do
    root to: 'catalogs#index'
    resources :articles
    resources :catalogs do
      resources :products
    end
  end

  match ':hiperlink' => "articles#show"#, :as => 'hiperlink'

end
