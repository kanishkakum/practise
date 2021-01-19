class Api::V1::RegistrationsController < Devise::RegistrationsController
  before_action :permit_all_params

  def create
  	user = User.create(sign_up_params)
  	if user.save
  	  token = JWT.encode({user_id: User.find_by(email: sign_up_params[:email]).id}, 's3cr3t')
  	  puts token
  	  puts user.id
  	  render json: json.to_token 
    else
      render json: {errors: {'email orr password' => ['is invalid']}}, status: :unprocessable_entity
    end
  end

  def sign_up_params
  	params.except('controller', 'action')
  end
  
  def permit_all_params
  	permit.params
  end	

end	