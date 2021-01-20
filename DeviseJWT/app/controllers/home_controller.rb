class HomeController < ApplicationController
  before_action :process_token
  def index
  	@user = current_user
  end

  def show
  	user = User.find(@current_user_id)
  	render json: {data: user}
  end	

  def process_token
  	if request.headers['Authorization'].present?
  	  begin
  	  	jwt_payload = JWT.decode(request.headers['Authorization'], 's3cr3t', true, algorithm: 'HS256')
  	  	@current_user_id = jwt_payload[0]['user_id'].to_i
  	  	  puts jwt_payload
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
      	render json: {status: 404, message: "unauthorized user"}
      end
    end
  end
  	# debugger
  	# render json: {message: 'Current User', data: User.find(@current_user_id) }, status: :ok
  
end