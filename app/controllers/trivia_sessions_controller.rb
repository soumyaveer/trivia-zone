class TriviaSessionsController < ApplicationController
  before_action :load_trivia, only: [:create, :new, :show, :destroy]

  def create
    @trivia_session = @trivia.trivia_sessions.build(create_params)
    @trivia_session.player = self.current_user

    if @trivia_session.save
      redirect_to trivia_trivia_session_path(@trivia, @trivia_session)
    else
      render :new
    end
  end

  def destroy
    trivia_session = @trivia.trivia_sessions.find(params[:id])
    trivia_session.destroy
    redirect_to root_path
  end

  def new
    @trivia_session = TriviaSession.new(trivia: @trivia)
  end

  def show
    @trivia_session = @trivia.trivia_sessions.find(params[:id])
  end

  private

  # Example params: {"trivia_session"=>{"question"=>{"1"=>{"answer_id"=>"1"}, "2"=>{"answer_id"=>"4"}}}}
  # Returns a new hash created from specifically selecting the required param keys.
  # I found using strong_parameters on params hash with dynamic keys to be convoluted, this is simpler.
  def create_params
    trivia_session_params = params[:trivia_session]
    answers_attributes = {}

    trivia_session_params[:question].each do |question_id, answer_hash|
      answers_attributes[question_id] = { answer_id: answer_hash[:answer_id] }
    end

    { question: answers_attributes, trivia_id: trivia_session_params[:trivia_id] }
  end

  def load_trivia
    @trivia = Trivia.find(params[:trivia_id])
  end
end
