Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do	
      devise_for :users,
      controller: 
      {
      	registrations: 'api/v1/registrations',
      	sessions: 'api/v1/sessions'
      }
      get '/', to: 'home#index'
    end
  end    


  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
