class Trivia < ApplicationRecord
  has_many :trivia_sessions, dependent: :destroy
  has_many :players, -> { distinct }, class_name: "User",  through: :trivia_sessions
  belongs_to :topic
  belongs_to :author, class_name: "User"
  has_many :questions, dependent: :destroy
  has_many :answers, through: :questions
  accepts_nested_attributes_for :questions

  validates :title, presence: true
  validates :title, uniqueness: true

  def max_score_of_player(player)
    trivia_sessions = self.trivia_sessions.for_player(player)
    trivia_sessions.map(&:score).max || 0
  end

  def self.authored_by(user)
    where(author_id: user.id)
  end

  def self.search(string)
    where('title LIKE ? OR description LIKE ?', "%#{string}%", "%#{string}%")
  end
end
