class ProductsController < ApplicationController

  def xyz

  end

  def index
    @products = Product.all
  end	

  def show
    @products = Product.find(params[:id])
  end	

  def new
    @product = Product.new
  end  	

  def create
  	@product = Product.new(product_params)
  	respond_to do |format|
  	  if @product.save

  	    format.html {redirect_to @product, notice: 'product was successfully created'}
  	    format.json {render :show}
  	  else
  	    format.html {render :new}
  	    format.json {render json: @product.errors, status: :unprocessability_entity}
  	  end
  	end
  end 	      	


end	