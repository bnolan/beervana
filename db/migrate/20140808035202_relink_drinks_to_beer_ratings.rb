Drink.class_eval do
  belongs_to :beer
end

class RelinkDrinksToBeerRatings < ActiveRecord::Migration
  def up
    add_column :drinks, :beer_rating_id, :integer

    event = Event.current

    BeerRating.all.each do |beer_rating|
      Drink.where(beer_id: beer_rating.beer_id).update_all(beer_rating_id: beer_rating.id)
    end

    remove_column :drinks, :beer_id
    change_column_null :drinks, :beer_rating_id, false
  end

  def down
    add_column :drinks, :beer_id, :integer

    BeerRating.all.each do |beer_rating|
      Drink.where(beer_rating_id: beer_rating.id).update_all(beer_id: beer_rating.beer_id)
    end

    remove_column :drinks, :beer_rating_id
  end
end
