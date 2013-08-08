class DrinksController < ApplicationController

  def new
    @drink = Drink.new :beer_id => params[:beer_id]
  end
  
  def create
    @drink = current_user.drinks.build drink_params
    
    if @drink.save
      flash[:message] = "Your drink was saved"
      redirect_to root_path
    elsif @drink.errors[:beer_id].any?
      render :text => "Error: Your beer was not found, please search again and select one of the beers from the drop down"
    else
      render :text => "Error: " + @drink.errors.collect { |k,v| [k,v].join(" ") }.join(', ')
    end
  end

  private
  
  def drink_params
    params.require(:drink).permit(:beer_id, :notes, :rating, :volume)
  end
  
end
