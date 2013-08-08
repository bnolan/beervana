class Drink < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  validates_presence_of :volume, :beer_id, :user_id, :rating
  after_save :update_beer_average_rating
  
  def before_save
    self.session = 1 # todo - implement session numbering
  end


private

  def update_beer_average_rating
    beer.update_average_rating
  end
  
end
