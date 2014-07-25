class Beer < ActiveRecord::Base
  # require 'descriptive_statistics'

  belongs_to :brewery
  has_many :drinks

  def self.top(limit = 500)
    order("average_rating DESC", :name => :asc).limit(limit).includes(:brewery)
  end

  def self.alpha
    order(:name).includes(:brewery)
  end

  def recent_drinks
    drinks.order(:id => :desc).limit(100)
  end

  # Using "Lower bound of Wilson score confidence interval for a Bernoulli parameter" from here 
  #     http://www.evanmiller.org/how-not-to-sort-by-average-rating.html
  # I'm not sure that I'm converting the 5-star rating to a normalized 0-1 value correctly. Seems
  # to provide better results than drinks.average(&:rating).
  def ci_lower_bound(pos, n, confidence)
      if n == 0
          return 0
      end
      z = Statistics2.pnormaldist(1-(1-confidence)/2)
      phat = 1.0*pos/n
      (phat + z*z/(2*n) - z * Math.sqrt((phat*(1-phat)+z*z/(4*n))/n))/(1+z*z/n)
  end

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
    high_low.min / high_low.max * high_low_count / ratings_count
  end

  def update_average_rating
    update_attributes!(:average_rating => calculate_average_rating, :controversiality => calculate_controversiality)
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
    result = {
      :id => id,
      :name => name,
      :brewery_name => brewery.name,
      :brewery_id => brewery.id,
      :average_rating => average_rating,
      :controversiality => controversiality,
      :abv => abv,
      :ibu => ibu,
      :style => style,
      :details => details,
      :hops => hops,
      :location => location,
      :drink_count => drinks.count,
      :created_at => created_at,
      :updated_at => updated_at
    }

    if args.first[:detailed]
      result[:drinks] = drinks
    end

    result
  end
end
