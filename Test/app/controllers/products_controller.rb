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

  def edit
    @product = Product.find(params[:id])
  end    	
  
  def update
  	respond_to do |format|

      if @product.update(product_params)
   
        format.html{redirect_to @product, notice: "product was successfully updated"}
        format.json {render :show}
      else 
        format.html{render :edit}
        format.json {render json: @product.errors, status: :unprocessability_entity}
      end
    end
  end     




  private

  def product_params
  	params.permit(:name, :description, :price, :make)
  end

end	