class AddAverageRatingToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :average_rating, :float, :default => 0.0
  end
end
