class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :drinks

  def update_average_rating
    update_attributes(:average_rating => drinks.average(:rating))
  end

  def as_json(*args)
    {
      :id => id,
      :name => name,
      :brewery => brewery.name
    }
  end
  
end
