class BeersController < ApplicationController

  def index
    @beers = if params[:sort_by] == 'abv'
        Beer.includes(:brewery).order 'abv desc'
      elsif params[:sort_by] == 'name'
        Beer.includes(:brewery).order 'name asc'
      elsif params[:sort_by] == 'controversiality'
        Beer.includes(:brewery).order('controversiality desc')
      else
        Beer.includes(:brewery).top
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
