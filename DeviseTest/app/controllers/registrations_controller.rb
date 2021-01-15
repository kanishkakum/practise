class RegistrationsController < Devise::RegistrationsController
  before_action :permit_all_params
   skip_before_action :verify_authenticity_token


  def create
    user =User.create(sign_up_params)
    if user.save

      token = JWT.encode({user_id: User.find_by(email: sign_up_params['email']).id}, 's3cr3t')
      puts token
      puts user.id
      render json: token.to_json
    else
      render json: {errors: {'email or password' => ['is invalid']}} , status: :unprocessable_entity
    end   	
  end

  private

  def sign_up_params
  	params.except('controller', 'action')
  end
  
  def permit_all_params
    params.permit!
  end  	


end	