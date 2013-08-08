class Drink < ActiveRecord::Base
  belongs_to :beer, :counter_cache => true
  belongs_to :user
  validates_presence_of :volume, :beer_id, :user_id, :rating
  after_save :update_beer_average_rating
  validates_inclusion_of :rating, :within => 1..5, :message => "must be between 1 and 5"
  
  def before_save
    self.session = 1 # todo - implement session numbering
  end
  
  def alcohol_in_mls
    # @proglottis pointed out that this isn't correct, but it's an approximation
    volume * (beer.abv / 100.0)
  end

private

  def update_beer_average_rating
    beer.update_average_rating
  end
  
end
