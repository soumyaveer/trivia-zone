class Topic < ApplicationRecord
  has_many :trivias, dependent: :destroy
  has_many :players, -> { distinct }, class_name: 'User', through: :trivias
  has_many :trivia_sessions, through: :trivias
  validates :name, presence: true, uniqueness: true

  def top_players
    self.players.sort do |player_a, player_b|
      player_b.topic_score(self) <=> player_a.topic_score(self)
    end.first(3)
  end

  def trivias_authored_by(user)
    self.trivias.authored_by(user)
  end

  def trivias_played_by(player)
    self.trivia_sessions.for_player(player)
  end
end
