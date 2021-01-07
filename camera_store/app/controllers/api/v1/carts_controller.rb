class Api::V1::CartsController < ApplicationController
  #before_action :authenticate_user  
  
  def index
    product = @user.cart.products
    render json: products
  end 	

  def create
    cart = Cart.new(cart_params)
    if cart.save
      render json: {status: 'success', "cart created", data: cart}
    else
      render json: {status: 'error', message: 'cart not created', data: cart}
    end
  end      

  def add_to_cart
    add_product(params[:product_id])
  end

 


end