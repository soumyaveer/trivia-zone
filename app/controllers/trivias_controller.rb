class TriviasController < ApplicationController
  before_action :load_trivia, only: [:show, :result]

  def index
    @topic = Topic.find_by(id: params[:topic_id])
    @trivias = @topic.trivias
  end

  def show
    @questions = @trivia.questions

  end

  def result
    if @trivia.trivia_sessions.update(user_id: current_user.id)
      @trivia_session = current_user.trivia_sessions.find_by(trivia_id: @trivia.id)
    else
      render :show
    end
    # puts @trivia_session.inspect
    # calculate and add results here
  end

  def new
    @trivia = Trivia.new
  end

  def create
    @topic = Topic.find_by(id: params[:topic_id])
    @trivia = Trivia.new(title: params[:title], description: params[:description], topic_id: @topic.id, user_id: current_user.id)
    if @trivia.save
      redirect_to topic_trivia_path(@topic, @trivia)
    else
      render :new
    end
  end

  private

  def load_topic
    @topic = Topic.find_by(id: params[:topic_id])
  end

  def load_trivia
    load_topic
    @trivia = Trivia.find(params[:id])
  end

  def trivia_params
    params.require(:trivia).permit(:title,
                                   :description,
                                   :topic_id,
                                   :user_id,
                                   :questions_attributes => [:id, :description],
                                   :answers_attributes => [:id, :description, :correct])

  end
end
