class DashboardController < ApplicationController
  before_filter :requires_current_user, :only => [:index]
  
  def index
    @top_beers = BeerListQuery.new.by_average_rating.limit(5)
    @recent_drinks = Drink.order('created_at desc').limit(20)
  end

  def leaderboard
    @users = User.all.sort_by(&:standard_drinks).reverse
  end
end
