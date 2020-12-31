class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2

    from_google_params
    user = create_user

    if user.present?
      sign_out_all_scopes
      flash[:success] = t 'devise.omniauth_callbacks.success', kind: 'Google' 
      sign_in_and_redirect user, event: :authentication
    else
      flash[:alert] = t 'devise.omniauth_callbacks.failure', kind: 'Google', reason: "#{auth.info.email} is not authorized."
      redirect_to new_user_session_path
    end
  end

  protected

  def after_omniauth_failure_path_for(_scope)
    new_user_session_path
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || root_path
  end

  private

  def from_google_params
    @from_google_params ||= {
      email: auth.info.email,
      username: auth.info.username
      
    }
  end

  def auth
    @auth ||= request.env['omniauth.auth']
  end

  def create_user
    User.create_with(skip_password_validation: true, username: @from_google_params[:username]).find_or_create_by(email: @from_google_params[:email])
  end

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

     unless user
         user = User.create(name: data['name'],
            email: data['email'],
            password: Devise.friendly_token[0,20]
         )
      end
    user
end
end