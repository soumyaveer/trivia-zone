class TriviaSessionsController < ApplicationController
  before_action :load_trivia, only: [:create, :new, :show]

  def create
    @trivia_session = @trivia.trivia_sessions.build
    @trivia_session.user = current_user
    @trivia_session.answers << find_answers(@trivia)
    if @trivia_session.save!
      redirect_to trivia_trivia_session(@trivia, @trivia_session)
    else
      render :new
    end
  end

  def new
    @trivia_session = TriviaSession.new
  end

  def show
    @trivia_session = @trivia.trivia_sessions.find(params[:id])
  end

  private

  def create_params
    params.require(:trivia_session).permit(:answer_ids => [] )
  end

  def find_answers(trivia)
    questions = params[:trivia_session][:question]
    current_answer_ids = []
    answers = []

    questions.each do |question, answer_id|
      current_answer_ids << answer_id.values
    end

    current_answer_ids.each do |answer_id|
      answers << trivia.answers.find(answer_id)
    end

    answers
  end

  def load_trivia
    @trivia = Trivia.find(params[:trivia_id])
  end
end
