class DashboardController < ApplicationController
  before_filter :requires_current_user
  
  def index
    # leaderboard stuff...
  end
end
