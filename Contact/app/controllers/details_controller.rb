class DetailsController < ApplicationController
  def index
    @details = current_user.details
  end

  def show
   @detail = Detail.find(params[:id])
  end 

  def new 
  	@detail = Detail.new
  end
  
  def create
    @detail = Detail.new(detail_params)
    if @detail.save
      redirect to Details_path, notice: "Detail created successfully"
    else
      redirect :new
    end
  end

  def edit
    @detail = Detail.find(params[:id])
  end
  
  def update
    @detail = Detail.find(params[:id])
    if @detail.update(detail_params)
      redirect_to Details_path, notice: "Detail Updated successfully"
    else
      redirect :edit
    end
  end

  def destroy
    @detail = Detail.find(params[:id])
    if @detail.destroy
      redirect_to Details_path, notice: "Detail deleted successfully"
    end
  end
  
  private

  def permit_params
    params.require(:user).permit(:name, :contact_no, :street, :gender, :city, :zip, :city, :adhar_no ).merge(:user_id)
  end
end      
                       	
