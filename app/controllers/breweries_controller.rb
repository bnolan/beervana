class BreweriesController < ApplicationController

	def index
		@breweries = Brewery.order('name asc').all
		render :json => @breweries
	end

end
