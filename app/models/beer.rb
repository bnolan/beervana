class Beer < ActiveRecord::Base
  require 'statistics2'
  belongs_to :brewery
  has_many :drinks

  def self.top(limit = 500)
    max_drinks = maximum(:drinks_count) || 0
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

  def calculate_average_rating
    if drinks.any?
      begin
        p = drinks.collect { |d| (d.rating.to_f - 2.5) / 2.5 }.sum
        ci_lower_bound(p, drinks.count, 0.9) * 2.5 + 2.5
      rescue
        2.5 # fixme
      end
    else
      2.5
    end
  end

  def update_average_rating
    update_attributes(:average_rating => calculate_average_rating)
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
      :brewery => brewery.name,
      :average_rating => average_rating,
      :abv => abv,
      :drink_count => drinks.count
    }

    if args.first[:detailed]
      result[:drinks] = drinks
    end

    result
  end
end
