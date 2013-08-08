class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.decimal :abv
      t.integer :brewery_id 
      t.integer :ibu

      t.timestamps
    end
  end
end
