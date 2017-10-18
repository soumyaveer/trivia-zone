class User < ActiveRecord::Base
  has_many :trivia_sessions
  has_many :trivias, through: :trivia_sessions
end
