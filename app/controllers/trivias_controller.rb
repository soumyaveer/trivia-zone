class TriviasController < ApplicationController
  before_action :load_trivia, only: [:edit, :update, :destroy]
  before_action :load_topic, only:[:destroy]

  def create
    @topic = Topic.find_by(id: params[:topic_id])
    @trivia = @topic.trivias.build(trivia_params)
    @trivia.author = current_user

    if @trivia.save
      redirect_to topic_trivias_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @trivia.destroy
    redirect_to topic_trivias_path(@topic)
  end

  def edit
  end

  def index
    @topic = Topic.find_by(id: params[:topic_id])
    @trivias = @topic.trivias

    @authored_trivias = @topic.trivias_authored_by(current_user)
  end

  def new
    @topic = Topic.find(params[:topic_id])
    @trivia = @topic.trivias.build

    10.times do
      question = @trivia.questions.build

      4.times do
        question.answers.build
      end
    end
  end

  def update
    if @trivia.update_attributes(trivia_params)
      redirect_to new_trivia_trivia_session_path(@trivia)
    else
      render :edit
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
    params.require(:trivia).permit(
      :title,
      :description,
      questions_attributes:
        [
          :id,
          :description,
          answers_attributes:
            [
              :id,
              :description,
              :correct
            ]
        ]

    )
  end
end
