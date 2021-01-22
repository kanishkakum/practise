class Api::V1::CartsController < ApplicationController
  before_action :permit_all_params
  
  # def add_items
  #   products.each do |product_id|
  #     @user.cart.products << params[:products].find(id: product_id)
  #   end  
  # end

  def add_product
    @user = User.find_by(id: params['user'])
    products = params['products'].split(',')
    products.each do |product_id|
      @user.cart.products << Product.find_by(id: product_id)
    end 
    render json: {data: @user.cart.products }
  end   

  def show
    @cart = Cart.find_by(user_id: params[:id])
    render json: {data: @cart}
  end    

  def permit_all_params
    params.permit!
  end  
end