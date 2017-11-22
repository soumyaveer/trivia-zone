class TriviaSessionsController < ApplicationController
  def create
    @trivia = Trivia.find(params[:trivia_id])
    @trivia_session = @trivia.trivia_sessions.build
    @trivia_session.user = current_user
    if @trivia_session.save!
      render plain: "ok", status: 200
    else
      render :new
    end
  end


  def new
    @trivia = Trivia.find(params[:trivia_id])
    @trivia_session = TriviaSession.new
  end

  private

  def create_params
    params.require(:trivia_session).permit(:question => [], answer_ids: [])
  end
end
