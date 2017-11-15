class TriviaZoneController < ApplicationController
  def index
    @topics = Topic.all
    @trivia_sessions = current_user.trivia_sessions if current_user
  end
end
