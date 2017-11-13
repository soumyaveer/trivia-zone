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

  private

  def load_topic
    @topic = Topic.find_by(id: params[:topic_id])
  end

  def load_trivia
    load_topic
    @trivia = Trivia.find(params[:id])
  end
end
