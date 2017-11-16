class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  private
  def topic_params
    params.require(:topic).permit(:name)
  end
end
