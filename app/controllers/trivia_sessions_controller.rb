class TriviaSessionsController < ApplicationController
  before_action :load_trivia, only: [:create, :new, :destroy]

  def create
    @trivia_session = @trivia.trivia_sessions.build(create_params)
    @trivia_session.player = self.current_user

    if @trivia_session.save
      redirect_to trivia_session_path(@trivia_session)
    else
      render :new
    end
  end

  def destroy
    trivia_session = @trivia.trivia_sessions.find(params[:id])
    trivia_session.destroy
    redirect_to root_path
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @topic = Topic.find_by(id: params[:topic_id])
    @played_trivias = @topic.trivias_played_by(@user)
  end

  def new
    @trivia_session = TriviaSession.new(trivia: @trivia)
    @trivia_session_topic = @trivia_session.trivia.topic
  end

  def show
    @trivia_session = current_user.trivia_sessions.find(params[:id])

    respond_to do |format|
      format.html { render :show }
      format.json { render json: @trivia_session }
    end
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

    {
      question: answers_attributes,
      trivia_id: trivia_session_params[:trivia_id],
      feedback: trivia_session_params[:feedback]
    }
  end

  def load_trivia
    @trivia = Trivia.find(params[:trivia_id])
  end
end
