class AddControversialityToBeers < ActiveRecord::Migration
  def change
  	add_column :beers, :controversiality, :float

  	Beer.all.each do |beer|
  		beer.update_average_rating
  	end
  end
end
