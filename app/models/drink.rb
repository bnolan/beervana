class Drink < ActiveRecord::Base
  belongs_to :beer, :counter_cache => true
  belongs_to :user
  validates_presence_of :volume, :beer_id, :user_id, :rating
  # validate :session_in_progress
  validates_inclusion_of :rating, :within => 1..5, :message => "must be between 1 and 5"

  # before_validation :populate_session, :on => :create
  after_save :update_beer_average_rating

  def alcohol_in_mls
    # @proglottis pointed out that this isn't correct, but it's an approximation
    volume * (beer.abv / 100.0)
  end

  SESSIONS = {
    0 => Time.new(2013, 8, 1,  01)..Time.new(2013, 8, 9,  11), # the hackers session
    1 => Time.new(2013, 8, 9,  11)..Time.new(2013, 8, 9,  16),
    2 => Time.new(2013, 8, 9,  18)..Time.new(2013, 8, 9,  23),
    3 => Time.new(2013, 8, 10, 11)..Time.new(2013, 8, 10, 16),
    4 => Time.new(2013, 8, 10, 18)..Time.new(2013, 8, 10, 23)
  }

private
  def update_beer_average_rating
    beer.update_average_rating
  end

  def current_session
    match = SESSIONS.find { |(session,time_range)| time_range.cover?(Time.now) }
    match[0] if match
  end

  def populate_session
    self.session = current_session
  end

  # Validation
  def session_in_progress
     self.errors.add(:session, "must be in progress to log drinks.") if session.blank?
  end
end
