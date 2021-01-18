class BaseController < ActionController::API
  respond_to :html, :json
  before_action :process_token
   skip_before_action :verify_authenticity_token



  private

  def process_token
  	if.request.headers['Authorization'].present?
  	  begin
  	  	jwt_payload = JWT.decode(request.headers['Authorization'], 's3cr3t', true, algorith: 'HS256')
  	  	@current_user_id = jwt_payload[0]['user_id'].to_i
  	  	  puts jwt_payload
  	  rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
  	    head :unauthorized
  	  end
  	end    	  
  end

  def authenticate_user!(options = {})
  	head :unauthorized unless signed_in?
  end
  
  def signed_in?
    @current_user_id.present?
  end
  
  def current_user
    @current_user ||= super || User.find_by(id: @current_user_id)
  end    	


end	