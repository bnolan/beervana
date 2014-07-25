class UpdateControversialityColumnOnBeers < ActiveRecord::Migration
  def up
    change_column :beers, :controversiality, :float, :default => 0.0
  end
  def down
    change_column :beers, :controversiality, :float, :default => nil
  end
end
