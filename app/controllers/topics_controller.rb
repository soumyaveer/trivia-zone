class TopicsController < ApplicationController
  def create
    @topic = Topic.create(topic_params)
    render json: @topic, status: 201
  end

  def index
    @topics = Topic.all
    respond_to do |format|
      format.html { render :index }
      format.json { render json: @topics }
    end
  end

  def new
    @topics = Topic.all
    @topic = Topic.new
  end

  def show
    @topic = Topic.find_by(id: params[:id])
    @trivias = @topic.trivias

    @authored_trivias = @topic.trivias_authored_by(current_user)
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @topic }
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:name)
  end
end
