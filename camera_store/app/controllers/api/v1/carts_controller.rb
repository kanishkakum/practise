class Api::V1::CartsController < ApplicationController
  #before_action :authenticate_user  
  
  def index
    product = @user.cart.products
    render json: products
  end 	


  def add_to_cart
    @cart = params[:product_id]
  end

 


end