class HomeController < ApplicationController
  #before_action :process_token
  def index
  	@user = current_user
  end
  	# debugger
  	# render json: {message: 'Current User', data: User.find(@current_user_id) }, status: :ok
  
end