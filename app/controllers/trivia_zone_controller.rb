class TriviaZoneController < ApplicationController
  def index
    @topics = Topic.all
    @trivia_sessions = current_user.trivia_sessions if current_user
  end

  private
  def trivia_zone_params
    params.require(:topic).permit(:name)
    params.require(:trivia_sessions).permit(:user_id, :trivia_id)
  end
end
