class DashboardController < ApplicationController
  before_filter :requires_current_user, :only => [:index]
  
  def index
    # leaderboard stuff...
  end
end
