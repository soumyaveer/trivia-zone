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
    # if @trivia.trivia_sessions.update(user_id: current_user.id)
    #   @trivia_session = current_user.trivia_sessions.find_by(trivia_id: @trivia.id)
    # else
    #   render :show
    # end
    # calculate and add results here
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

  def create
    @topic = Topic.find_by(id: params[:topic_id])

    @trivia = @topic.trivias.build(trivia_params)

    @trivia.author = current_user

    if @trivia.save!
      redirect_to topic_trivias_path(@topic)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  #
  # def correct_answers_count
  #   correct_answer = 0
  #   correct_answer += 1 if answers.correct
  #   correct_answer
  # end

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
                                   questions_attributes:
                                     [:id,
                                      :description,
                                      answers_attributes:
                                        [:id,
                                         :description,
                                         :correct
                                        ]
                                     ]

    )
  end
end
