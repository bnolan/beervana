class User < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :password
  has_many :drinks
  
  def self.hash_password(passwd)
    BCrypt::Password.create(passwd)
  end

  def password_is?(passwd)
    password.present? && BCrypt::Password.new(password) == passwd
  end
  
  def standard_drinks
    begin
      drinks.collect(&:alcohol_in_mls).sum / 10.0
    rescue
      0
    end
  end
  
  # trololol
  
  def drinks_brewery_count
    drinks.collect(&:beer).compact.collect(&:brewery_id).uniq.count
  end
  
  def drinks_volume_sum
    drinks.collect(&:volume).sum
  end
  
  def as_json(*params)  
    {
      :name => name,
      :id => id,
      :standard_drinks => standard_drinks
    }
  end
end
