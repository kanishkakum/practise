class Api::V1::UsersController < ApplicationController
  
  
  def index
    users = User.all 
    render json: {status: "SUCCESS", message: 'User Load Sucessful', data:users}
  end  

  def create
  	user = User.new(user_params)
  	if user.save
  	  render json: {status: 'SUCCESS', message: 'User Saved Sucessful', data:user}
    else
      render json: {status: 'ERROR', message: 'User Saved Unsucessful', data:user.errors} 
    end
  end  

  def show
    user = User.find(params[:id])
    render json: {data:user}
  end  	

  def update
  	user = User.find(params[:id])
  	if user.update(user_params)
  	  render json: {status: 'SUCCESS', message: 'User updated Successful', data:user}
  	else
  	  render json: {status: 'ERROR', message: 'User updated Unsucessful', data:user}
  	end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json: {status: 'SUCCESS', message: 'User deleted Successful', data:user}
    else
      render json: {status: 'SUCCESS', message: 'User deleted Unsucessful', data:user}
    end
  end
  

  private

  def user_params
    params.permit(:username, :password)
  end    	
      	    	

end
