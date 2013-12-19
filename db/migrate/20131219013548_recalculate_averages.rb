class RecalculateAverages < ActiveRecord::Migration
  def change
  	Beer.all.each(&:update_average_rating)
  end
end
