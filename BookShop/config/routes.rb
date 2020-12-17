Rails.application.routes.draw do
  resources :products 
  post "destroy_multiple", to: "products#destroy_multiple", as: "products_destroy"
  get "/soft-delete/:id" => "products#soft_delete"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end