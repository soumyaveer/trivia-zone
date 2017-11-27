class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topics = Topic.all
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to topics_path
    else
      render :index
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
