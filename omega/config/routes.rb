Rails.application.routes.draw do
 
  #devise_for :users
  root to: "home#index"

  #devise_for :users, :controllers => {:registrations => "user/registrations"}

  devise_for :users, controllers: { omniauth_callbacks: 'user/omniauth_callbacks' }
  

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
