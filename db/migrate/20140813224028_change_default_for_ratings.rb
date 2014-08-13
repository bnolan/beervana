class ChangeDefaultForRatings < ActiveRecord::Migration
  def change
    change_column :beer_ratings, :average_rating, :float, :default => 3.0, :null => false
  end
end
