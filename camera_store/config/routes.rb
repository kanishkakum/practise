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

      get 'categories/:id/products' => 'categories#index', :as => :category_products_path

      get 'users/:id/categories' => 'categories#show', :as => :category_path

      #get 'users/:id/carts' => 'carts#index', :as => :user_carts_path
      post '/add_to_cart/:product_id' => 'carts#add_to_cart', :as => 'add_to_cart'
    end
  end  	

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
