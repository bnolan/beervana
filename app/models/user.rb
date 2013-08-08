class User < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :drinks
  
  def standard_drinks
    drinks.collect(&:alcohol_in_mls).sum / 10.0
  end
  
  def taste
    rand
  end

  def drinks_brewery_count
    drinks.collect(&:beer).collect(&:brewery_id).uniq.count
  end
  
  def drinks_volume_sum
    drinks.collect(&:volume).sum
  end
  
  
end
