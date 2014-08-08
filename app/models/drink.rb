class Drink < ActiveRecord::Base
  belongs_to :beer_rating, :counter_cache => true
  belongs_to :user

  validates_presence_of :volume, :beer_rating_id, :user_id, :rating
  validates_inclusion_of :rating, :within => 1..5, :message => "must be between 1 and 5"

  after_save :update_beer_average_rating

  delegate :beer, :beer_id, to: :beer_rating, allow_nil: true

  def alcohol_in_mls
    # @proglottis pointed out that this isn't correct, but it's an approximation
    volume * ((beer.abv || 5) / 100.0)
  end

  def beer_id=(value)
    self.beer_rating_id = BeerRating.for_beer_id(value).id if value
  end

  def beer=(value)
    self.beer_id = value.id
  end

  def as_json(*args)
    {
      :id => id,
      :user => {
        :name => user.name,
        :id => user.id
      },
      :volume => volume,
      :beer_id => beer_id,
      :rating => rating,
      :notes => notes,
      :created_at => created_at,
      :updated_at => updated_at
    }
  end

  private

  def update_beer_average_rating
    beer_rating.recalculate!
  end
end
