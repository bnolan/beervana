class AddDescriptionToBreweries < ActiveRecord::Migration
  def change
    add_description :breweries, :description, :text

    Brewery.update_all :description => "description of the brewery"
  end
end
