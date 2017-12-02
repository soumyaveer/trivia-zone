class Topic < ActiveRecord::Base
  has_many :trivias
  validates :name, presence: true, uniqueness: true

  def players
    all_players_for_topic = []
    self.trivias.each do |trivia|
      trivia.trivia_sessions.each do |trivia_session|
        all_players_for_topic << trivia_session.player
      end
    end
    all_players_for_topic.uniq.sort {|player_a, player_b| player_b.topic_score(self) <=> player_a.topic_score(self)}.first(3)
  end

  def trivias_authered_by(user)
    self.trivias.where(author_id: user.id)
  end
end
