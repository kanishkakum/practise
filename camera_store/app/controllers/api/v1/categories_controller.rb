class Api::V1::CategoriesController < ApplicationController

  def index
    category = Category.all
    render json: {status: 'SUCCESS', messgae: 'Loaded Category', data:categories}
  end	

  def show
    category = Category.find(params[:id])
    render json: {status: "SUCCESS", message: 'Loaded Category', data:category}
  end	

  def create
  	category = Category.new(category_params)
  	if category.save
  	  render json: {status: "SUCCESS", message: 'Category Created Successfully', data:category}
  	else
  	  render json: {status: "ERROR", message: 'Category Created Unsucessful', data:category.errors}  
    end
  end
  
  def delete
    category = Category.find(params[:id])
    category.destroy
    render json: {status: "SUCCESS", message: 'Category Deleted Successfully', data:category}
  end
  
  def update
    category = Category.find(params[:id])
    if category.update_attributes(category_params)
      render json: {status: 'SUCCESS', message: 'Category updated Successfully', data:category}
    else
      render json: {status: 'ERROR', message: 'Category updated Unsucessful', data:category.errors}
    end
  end

  def category_params
    params.permit(:name, :category_type, :model)
  end            


end