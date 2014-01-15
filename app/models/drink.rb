class Drink < ActiveRecord::Base
  belongs_to :beer, :counter_cache => true
  belongs_to :user
  validates_presence_of :volume, :beer_id, :user_id, :rating
  validates_inclusion_of :rating, :within => 1..5, :message => "must be between 1 and 5"
  after_save :update_beer_average_rating

  def alcohol_in_mls
    # @proglottis pointed out that this isn't correct, but it's an approximation
    volume * ((beer.abv || 5) / 100.0)
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
    beer.update_average_rating
  end
end
