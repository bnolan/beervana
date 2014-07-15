class AddFieldsToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :style, :string
    add_column :beers, :hops, :string
    add_column :beers, :location, :string
    add_column :beers, :description, :text
  end
end
