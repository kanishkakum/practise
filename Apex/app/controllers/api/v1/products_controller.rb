module Api
  module V1
    class ProductsController <  ApplicationController
      def index
        products = Product.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Loaded products', data:products}, status: :ok	
      end

      def show
      	product = Product.find(params[:id])
      	render json: {status: 'SUCCESS', message:'Loaded products', data:product}, status: :ok
      end

      def create
      	product = Product.new(article_params)
      	if product.save
      	  render json: {status: 'SUCCESS', message:'product created successfully', data:product}, status: :ok	
      	else
      	  render json: {status: 'ERROR', message:'product not saved', data:product.errors}, status: :unprocessable_entity		
        end  
      end

      def destroy
        product = Product.find(params[:id])
        product.destroy
        render json: {status: 'ERROR', message:'Deleted product', data:product}, status: :ok  
      end 

      def create
        product = Product.find(params[:id])
        if product.update_attributes(product_params)
          render json: {status: 'SUCCESS', message:'product updated successfully', data:product}, status: :ok 
        else
          render json: {status: 'ERROR', message:'product not updated', data:product.errors}, status: :unprocessable_entity   
        end  
      end 

      private

      def article_params
        params.permit(:title, :description)
      end  

    end
  end	
end