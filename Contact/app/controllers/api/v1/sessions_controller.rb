class Api::V1::SessionsController < Devise::SessionsController
  before_action :sign_in_params
 
  skip_before_action :verify_authenticity_token
  

  def create
  	user = User.find_by_email(sign_in_params[:email])
  	if user && user.valid_password?(sign_in_params[:password])
  	  token = JWT.encode({user_id: user.id}, 's3cr3t')
  	  render json: {status: 200, message: "SUCCESS", data: user, token: token.to_json}, status: :ok
  	else
  	  render json: {errors: {'email or password' => ['is invalid']}}, status: :unprocessable_entity
  	end
  end

  def sign_in_params
    params.permit(:email, :password)
  end	    

end	
