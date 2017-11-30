class Trivia < ActiveRecord::Base
  has_many :trivia_sessions
  has_many :users, through: :trivia_sessions # TODO: players
  belongs_to :topic
  belongs_to :author, class_name: "User"
  has_many :questions
  has_many :answers, through: :questions
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates :title, presence: true
  validates :title, uniqueness: true

  def self.search(string)
    where('title LIKE ? OR description LIKE ?', "%#{string}%", "%#{string}%")
  end

  def max_score_of_user(user)
    trivia_sessions = self.trivia_sessions.where(user_id: user.id)
    trivia_sessions.map(&:score).max || 0
  end
end
