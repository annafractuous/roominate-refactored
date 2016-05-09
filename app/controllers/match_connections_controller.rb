class MatchConnectionsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @matches = @user.good_matches
    @match_connections = MatchConnection.where(user: @user, match: @matches)
  end

  def show
    @user = User.find(params[:user_id])
    @match = User.find(params[:match_id])
    @cleanliness_compatibility = CompatibilityCalculator.get_compat_score_for_category(@user, @match, "cleanliness")
    @schedule_compatibility = CompatibilityCalculator.get_compat_score_for_category(@user, @match, "schedule")
    @habits_compatibility = CompatibilityCalculator.get_compat_score_for_category(@user, @match, "habits")
  end
end
