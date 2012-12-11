InitialRelease::Application.routes.draw do

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  devise_for :users
  mount Ckeditor::Engine => '/ckeditor'

  post '/cart/add_to_cart' => "cart#add_to_cart", as: 'add_to_cart'
  
  get '/cart/conversion/:product/:quantity' => 'cart#conversion', as: 'cart_conversion'
  delete '/cart/destroy_cart_item/:product' => 'cart#destroy_cart_item', as: 'destroy_cart_item'
  get '/cart' => "cart#index", as: 'cart'


  resources :news
  resources :orders
  
  root to: 'articles#show'#, id: Article.find_by_title('root').id
  resources :articles
  resources :catalogs do
    resources :products
  end

  match ':hiperlink' => "articles#show"#, :as => 'hiperlink'

end
