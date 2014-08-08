class RemoveFieldsFromBeers < ActiveRecord::Migration
  def up
    remove_column :beers, :average_rating
    remove_column :beers, :drinks_count
    remove_column :beers, :controversiality
  end

  def down
    add_column :beers, :average_rating, :float, default: 0.0
    add_column :beers, :drinks_count, :integer
    add_column :beers, :controversiality, :float, default: 0.0
  end
end
