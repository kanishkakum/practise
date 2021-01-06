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
    end
  end  	

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
