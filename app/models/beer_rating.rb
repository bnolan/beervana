class BeerRating < ActiveRecord::Base
  belongs_to :beer
  belongs_to :event
  has_many :drinks, dependent: :destroy

  scope :current, -> { where(event_id: Event.current.id) }

  validates :beer_id, :event_id, :average_rating, :controversiality, presence: true

  def self.for_beer_id(beer_id)
    begin
      find_or_create_by(beer_id: beer_id, event_id: Event.current)
    rescue ActiveRecord::RecordNotUnique
      retry
    end
  end

  def recalculate!
    update!(average_rating: calculate_average_rating, controversiality: calculate_controversiality)
  end
  
  def friendly_rating
    average_rating.round(1)
  end

  protected
  def weighted_drinks_ratings
    i = 10 # minimum number of votes required before we go all average

    if drinks.count >= i
      drinks.collect(&:rating)
    else
      drinks.collect(&:rating).concat ([3.0] * (i-drinks.count))
    end
  end

  # Hacked this up, which makes sense to me intuitively (as a non statistics-doing developer)
  def calculate_average_rating
    weighted_drinks_ratings.sum.to_f / weighted_drinks_ratings.count
  end

  def calculate_controversiality
    ratings = drinks.pluck(:rating)

    # We want decimals so our division works later
    ratings_count = ratings.count.to_d
    high_count = ratings.select { |r| r > 3.0 }.count.to_d
    low_count = ratings.select { |r| r < 3.0 }.count.to_d

    high_low = [high_count, low_count]
    high_low_count = high_count + low_count

    # Don't calculate nonsense - there's no controversy here.....
    return 0.0 if ratings_count < 5 || high_low.any? { |c| c.zero? }

    # Lifted from http://www.audiencedialogue.net/stat-controv.html - thanks Ben
    # This is now out of 5 for some unknown UI reason... sigh.
    (high_low.min / high_low.max * high_low_count / ratings_count) * 5.0
  end
end
