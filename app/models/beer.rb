class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :drinks

  def self.top(limit = 500)
    max_drinks = maximum(:drinks_count) || 0
    order("(average_rating * drinks_count/#{max_drinks}) + average_rating DESC", :name => :asc).limit(limit).includes(:brewery)
  end

  def self.alpha
    order(:name).includes(:brewery)
  end

  def recent_drinks
    drinks.order(:id => :desc).limit(100)
  end

  def update_average_rating
    update_attributes(:average_rating => drinks.average(:rating))
  end
  
  def friendly_abv
    if abv and abv > 0.0
      sprintf("%0.1f%", abv) 
    else
      "?"
    end
  end
  
  def friendly_ibu
    "#{ibu} IBU" if ibu
  end
  
  def friendly_rating
    average_rating.round(1)
  end

  def as_json(*args)
    {
      :id => id,
      :name => name,
      :brewery => brewery.name
    }
  end
  
end
