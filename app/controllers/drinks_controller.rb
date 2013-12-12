class DrinksController < ApplicationController

  def index
    @drinks = Drink.order('created_at desc').limit(100)

    render :json => @drinks
  end
  
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
