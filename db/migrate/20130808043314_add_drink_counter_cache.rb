class AddDrinkCounterCache < ActiveRecord::Migration
  def change
    add_column :beers, :drinks_count, :integer
  end
end
