class DrinksController < ApplicationController

  def new
    @drink = Drink.new :beer_id => params[:beer_id]
  end
  
  def create
    @drink = current_user.drinks.build drink_params
    
    if @drink.beer.blank? and params[:beer].present?
      @drink.beer = Brewery.find_by_name('Unknown').beers.create!(:name => params[:beer])
    end
    
    if @drink.save
      flash[:message] = "Your drink was saved"

      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => { :success => true, :drink => @drink } }
      end
    else
      message = "Error: " + @drink.errors.collect { |k,v| [k,v].join(" ") }.join(', ')

      respond_to do |format|
        format.html { render :text => message }
        format.json { render :json => { :success => false, :message => message } }
      end
    end
  end

  private
  
  def drink_params
    params.require(:drink).permit(:beer_id, :notes, :rating, :volume)
  end
  
end
