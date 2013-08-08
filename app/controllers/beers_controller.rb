class BeersController < ApplicationController

  def index
    @beers = if params[:sort_by] == 'abv'
        Beer.order 'abv desc'
      elsif params[:sort_by] == 'name'
        Beer.order 'name asc'
      else
        Beer.top
      end
  end

  def show
    @beer = Beer.find params[:id]
  end

end
