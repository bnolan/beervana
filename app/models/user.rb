class User < ActiveRecord::Base
  require 'digest/sha1'
  validates_uniqueness_of :name
  validates_presence_of :name, :password
  has_many :drinks
  
  def self.hash_password(passwd)
    Digest::SHA1.hexdigest("salty-hash-rainbow-table-#{passwd}")
  end

  def password_is?(passwd)
    User.hash_password(passwd) == password
  end
  
  def standard_drinks
    begin
      drinks.collect(&:alcohol_in_mls).sum / 10.0
    rescue
      0
    end
  end
  
  # trololol
  
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
  
  def as_json(*params)  
    {
      :name => name,
      :id => id,
      :standard_drinks => standard_drinks,
      :taste => taste
    }
  end
end
