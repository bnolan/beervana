class BeersController < ApplicationController

  def index
    relation = Beer.includes(:brewery, :current_beer_rating)

    @beers = case params[:sort_by]
    when 'abv'
      relation.order 'abv desc'
    when 'name'
      relation.order 'name asc'
    when 'controversiality'
      relation.order_by_controversiality
    else
      relation.limit(500).order 'beer_ratings.average_rating DESC'
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
