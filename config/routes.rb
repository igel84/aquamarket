Golf::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  post '/cart/add_to_cart', controller: :cart, action: :add_to_cart, as: 'add_to_cart'


  root to: 'articles#show'#, id: Article.find_by_title('root').id
  resources :articles
  resources :catalogs do
    resources :products
  end

  match ':hiperlink' => "articles#show"#, :as => 'hiperlink'

end
