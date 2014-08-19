class Brewery < ActiveRecord::Base
  has_many :beers

  def merge(other)
    other.beers.each { |b| b.update_attributes! :brewery_id => id }
    other.destroy
  end
  
end
