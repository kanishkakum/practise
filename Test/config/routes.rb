Rails.application.routes.draw do
  resources :products , only: [:index, :show, :create]
  root to: 'products#index'

  post 'products/xyz', to: 'products#xyz', as: 'xyz'	
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
