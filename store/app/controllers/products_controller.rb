class ProductsController < ApplicationController
	
  def index
  	@products = Product.search(params[:search])
  end

  def create
  	@product = Product.new(product_params)

      if @product.save
        ProductMailer.product_created(@product).deliver
        redirect_to @product, notice: 'Product was successfully created.' 
    
      else
        render :new 
        
      end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.' 
    else
      render :edit 
 
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
      redirect_to products_url, notice: 'Product was successfully deleted.' 
  end

  def new
  	@product = Product.new
  end

  def show
  	@product = Product.find(params[:id])
  end
  
  def edit
     @product = Product.find(params[:id])
  end
    
  private
  
    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:title, :description, :price, :image_url)
    end
end
