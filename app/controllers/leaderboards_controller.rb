class LeaderboardsController < ApplicationController
  def index
    @topics = Topic.all
  end
end
