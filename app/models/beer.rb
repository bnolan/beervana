class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :drinks

  def self.top(limit = 500)
    max_drinks = maximum(:drinks_count)
    order("(average_rating * drinks_count/#{max_drinks}) DESC", :name => :asc).limit(limit)
  end

  def recent_drinks
    drinks.order(:id => :desc).limit(100)
  end

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
