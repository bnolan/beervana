class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :starts_at, null: false
      t.index :starts_at, unique: true
      t.timestamps
    end
    
    Event.create!(starts_at: Time.now)
  end
end
