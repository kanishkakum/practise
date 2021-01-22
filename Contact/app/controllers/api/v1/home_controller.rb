module Api
  module V1
    class HomeController < BaseController
      def index
     	render json:  current_user
      end

      def show
      	
  	    user = User.find(@current_user_id)
     	render json: {data: user}
      end

    end
  end
end      