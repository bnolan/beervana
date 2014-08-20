class RecalculateAllBeerRatings < ActiveRecord::Migration
  def up
    BeerRating.all.each(&:recalculate!)
  end
end
