class Trivia < ActiveRecord::Base
  has_many :trivia_sessions
  has_many :players, class_name: "User",  through: :trivia_sessions
  belongs_to :topic
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :answers, through: :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true
  validates :title, uniqueness: true

  def max_score_of_player(player)
    trivia_sessions = self.trivia_sessions.where(player_id: player.id)
    trivia_sessions.map(&:score).max || 0
  end

  def self.search(string)
    where('title LIKE ? OR description LIKE ?', "%#{string}%", "%#{string}%")
  end
end
