class TriviasController < ApplicationController
  def index
    @topic = Topic.find_by(id: params[:topic_id])
    @trivias = @topic.trivias
  end

  def show
    @topic = Topic.find_by(id: params[:topic_id])
    @trivia = Trivia.find(params[:id])
    @questions = @trivia.questions
    # @answers = @questions.answers
  end
end
