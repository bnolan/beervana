class ForTheLoveOfAllThingsHolyAddSomeIndexes < ActiveRecord::Migration
  def change
    add_index :beers, :name
    add_index :beers, :abv
    add_index :beers, :brewery_id
    add_index :drinks, :user_id
    add_index :drinks, :created_at
    add_index :drinks, :beer_rating_id
    add_index :users, :email
  end
end
