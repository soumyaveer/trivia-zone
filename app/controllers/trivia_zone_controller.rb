class TriviaZoneController < ApplicationController
  def index
    @topics = Topics.all
    @trivias = current_user.trivia_sessions
  end
end
