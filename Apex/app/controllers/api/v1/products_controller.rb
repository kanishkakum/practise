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

    end
  end	
end