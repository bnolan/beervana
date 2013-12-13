class DashboardController < ApplicationController
  before_filter :requires_current_user, :only => [:index]
  
  def index
    # leaderboard stuff...
  end

  def leaderboard
  	@users = User.all.sort_by(&:standard_drinks).reverse
  end

end
