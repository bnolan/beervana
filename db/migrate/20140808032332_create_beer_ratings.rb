class CreateBeerRatings < ActiveRecord::Migration
  def change
    create_table :beer_ratings do |t|
      t.integer :beer_id, null: false
      t.integer :event_id, null: false

      t.float :average_rating, default: 0.0, null: false
      t.float :controversiality, default: 0.0, null: false
      t.integer :drinks_count, default: 0, null: false

      t.index [:beer_id, :event_id], unique: true
      t.index :event_id
      t.index :average_rating
      t.index :controversiality
      t.index :drinks_count

      t.timestamps
    end

    Beer.all.each do |beer|
      BeerRating.create!(beer: beer, event: event, drinks_count: beer.drinks_count)
    end
  end
end
