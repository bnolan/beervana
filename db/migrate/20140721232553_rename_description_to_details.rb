class RenameDescriptionToDetails < ActiveRecord::Migration
  def change
    rename_column :breweries, :description, :details
    rename_column :beers, :description, :details
  end
end
