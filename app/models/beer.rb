class Beer < ActiveRecord::Base
  belongs_to :brewery
  has_many :beer_ratings, dependent: :destroy
  has_many :drinks, through: :beer_ratings
  has_one :current_beer_rating, -> { where(event_id: Event.current.id) }, class_name: "BeerRating"

  scope :left_join_current_beer_ratings, -> { joins("LEFT JOIN beer_ratings ON beer_ratings.beer_id = beers.id AND beer_ratings.event_id = #{connection.quote Event.current.id}") }

  def self.top(limit = 500)
    order("beer_ratings.average_rating DESC").limit(limit).includes(:brewery)
  end

  def self.order_by_controversiality
    left_join_current_beer_ratings.order('controversiality desc')
  end

  def self.alpha
    order(:name).includes(:brewery)
  end

  def current_rating
    beer_ratings.current.first_or_create
  end

  def recent_drinks
    drinks.order(:id => :desc).limit(100)
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
  
  def as_json(*args)
    result = {
      :id => id,
      :name => name,
      :brewery_name => brewery.name,
      :brewery_id => brewery.id,
      :average_rating => current_beer_rating.try(:average_rating) || 3.0,
      :controversiality => current_beer_rating.try(:controversiality) || 0,
      :drink_count => current_beer_rating.try(:drinks_count) || 0,
      :abv => abv,
      :ibu => ibu,
      :style => style,
      :details => details,
      :hops => hops,
      :location => location,
      :created_at => created_at,
      :updated_at => updated_at
    }

    if args.first[:detailed]
      result[:drinks] = drinks
    end

    result
  end
end
