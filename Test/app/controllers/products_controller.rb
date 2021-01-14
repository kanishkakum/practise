class ProductsController < ApplicationController

  def xyz

  end

  def index
    @products = Product.all
  end	




end	