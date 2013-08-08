class BeersController < ApplicationController

  def index
    @beers = if params[:sort_by] == 'abv'
        Beer.includes(:brewery).order 'abv desc'
      elsif params[:sort_by] == 'name'
        Beer.includes(:brewery).order 'name asc'
      else
        Beer.includes(:brewery).top
      end
  end

  def show
    @beer = Beer.find params[:id]
  end

end
