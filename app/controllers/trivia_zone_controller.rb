class TriviaZoneController < ApplicationController
  before_action :load_trivia, only:[:index]

  def index
    @topics = Topic.all
    @trivia_sessions = current_user.trivia_sessions.order_by_created_at if current_user
  end

  private

  def trivia_zone_params
    params.require(:topic).permit(:name)
    params.require(:trivia_sessions).permit(:user_id, :trivia_id)
  end

  def load_trivia
    @trivia = load_trivia_for_search_params(params[:search]) if params[:search]
  end

  def load_trivia_for_search_params(search)
    @searched_string = search
    Trivia.search(@searched_string)
  end
end
