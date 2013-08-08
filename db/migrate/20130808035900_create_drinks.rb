class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :beer_id, :user_id, :volume, :session
      t.float :rating
      t.text :notes
      t.timestamps
    end
  end
end
