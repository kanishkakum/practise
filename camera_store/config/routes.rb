Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      devise_for :users,
      controllers: {
        registrations: 'api/v1/registrations',
         sessions: 'api/v1/sessions'
      }

      devise_scope :user do
        get "/" => "home#index"
      end

      resources :categories

      resources :products

      get 'users/:id/products' => 'products#index', :as => :user_products_path

      get 'categories/:id/' => 'categories#index', :as => :category_path

      get 'users/products/:id/category' => 'products#show_products', :as => :category_products_path

      post 'user/carts' => 'carts#add_product'

      post 'add_items' => 'carts#add_items', :as => 'add_to_cart'

      get 'user/carts/show_products' => 'home#show_products'
    end
  end  	

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
