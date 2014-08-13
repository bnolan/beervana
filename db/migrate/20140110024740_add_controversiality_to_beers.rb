class AddControversialityToBeers < ActiveRecord::Migration
  def change
  	add_column :beers, :controversiality, :float
  end
end
