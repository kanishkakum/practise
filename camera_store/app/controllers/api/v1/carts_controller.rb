class Api::V1::CartsController < ApplicationController
  #before_action :authenticate_user  
  
  def add_items
  products.each do |product_id|
    @user.cart.products << Product.find(id: product_id)
  end

  def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
    end
    if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end



end