class Trivia < ActiveRecord::Base
  has_many :trivia_sessions
  has_many :users, through: :trivia_sessions
  belongs_to :topic
  belongs_to :user
  has_many :questions
end
