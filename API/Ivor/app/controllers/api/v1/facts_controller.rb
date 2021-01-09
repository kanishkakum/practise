class Api::V1::FactsController < ApplicationController
  
  
  def index
    fact = Fact.all 
    render json: {status: "SUCCESS", message: 'facts Load Sucessful', data:facts}
  end  

  def create
  	fact = Fact.new(facts_params)
  	if fact.save
  	  render json: {status: 'SUCCESS', message: 'Facts Saved Sucessful', data:fact}
    end
      render json: {status: 'ERROR', message: 'Fact Saved Unsucessful', data:fact.errors} 
    end
  end  

  def show
    fact = Fact.find(params[:id])
  end  	

  def update
  	fact = Fact.find(params[:id])
  	if fact.update(facts_params)
  	  render json: {status: 'SUCCESS', message: 'Fact updated Successful', data:fact}
  	else
  	  render json: {status: 'ERROR', message: 'Fact updated Unsucessful', data:fact}
  	end
  end

  def destroy
    fact = Fact.find(params[:id])
    if fact.destroy
      render json: {status: 'SUCCESS', message: 'Fact deleted Successful', data:fact}
    else
      render json: {status: 'SUCCESS', message: 'Fact deleted Unsucessful', data:fact}

    end
  end
  

  private

  def facts_params
    params.require(:fact).permit(:fact, :likes, :user_id)
  end    	
      	    	

end