class DrinksController < ApplicationController
  
  def create
    @drink = current_user.drinks.build drink_params
    
    if @drink.save
      flash[:message] = "Your drink was saved"
      redirect_to root_path
    else
      render :text => "Error - drink " + @drink.errors.collect { |k,v| [k,v].join(" ") }.join(' ,')
    end
  end

  private
  
  def drink_params
    params.require(:drink).permit(:beer_id, :notes, :rating)
  end
  
end
