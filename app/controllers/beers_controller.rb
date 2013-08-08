class BeersController < ApplicationController

  def index
    @beers = params[:sort_by] == 'popular' ? Beer.top : Beer.order(:name)
  end

  def show
    @beer = Beer.find params[:id]
  end

end
