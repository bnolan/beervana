class ZeroNullFields < ActiveRecord::Migration
  def change
    execute("UPDATE beers set average_rating = 0.0 where average_rating is null")
    execute("UPDATE beers set drinks_count = 0 where drinks_count is null")
  end
end
