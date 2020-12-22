Rails.application.routes.draw do
  root 'products#index'	
  
  get 'products', to: 'products#index', as: 'products'   
  get 'products/:id', to: 'products#show', as: 'product'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
