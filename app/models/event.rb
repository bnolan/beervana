class Event < ActiveRecord::Base
  has_many :beer_ratings, dependent: :destroy

  def self.current
    where("starts_at <= ?", Time.zone.now).order(starts_at: :desc).first!
  end
end
