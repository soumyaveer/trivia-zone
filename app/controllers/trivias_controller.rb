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
end
