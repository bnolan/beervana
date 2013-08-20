class User < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name
  has_many :drinks

  def password_less?
    true
  end

  def standard_drinks
    begin
      drinks.collect(&:alcohol_in_mls).sum / 10.0
    rescue
      0
    end
  end
  
  def taste
    if drinks.any?
      0.5 + 
        (0.5 / drinks.count * drinks.where('beer_id in (?)', Beer.where('average_rating>3').collect(&:id)).count) -
        (0.5 / drinks.count * drinks.where('beer_id in (?)', Beer.where('average_rating<3').collect(&:id)).count)
    else
      0.5
    end
  end

  def drinks_brewery_count
    drinks.collect(&:beer).collect(&:brewery_id).uniq.count
  end
  
  def drinks_volume_sum
    drinks.collect(&:volume).sum
  end
  
  
end
