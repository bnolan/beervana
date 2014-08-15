class BeersController < ApplicationController
  def index
    query = BeerListQuery.new

    @beers = case params[:sort_by]
    when 'abv'              then query.by_abv
    when 'name'             then query.by_name
    when 'controversiality' then query.by_controversiality
    else                         query.by_average_rating
    end

    respond_to do |format|
      format.json { render :json => @beers }
      format.html
    end
  end

  def show
    @beer = Beer.find params[:id]

    respond_to do |format|
      format.json { render :json => @beer.as_json(:detailed => true) }
      format.html
    end
  end
end
