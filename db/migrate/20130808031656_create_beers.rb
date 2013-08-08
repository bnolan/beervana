class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :name
      t.decimal :abv, :precision => 3, :scale => 1
      t.integer :brewery_id 
      t.integer :ibu

      t.timestamps
    end
  end
end
