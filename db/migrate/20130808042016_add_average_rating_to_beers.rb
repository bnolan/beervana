class AddAverageRatingToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :average_rating, :float
  end
end
