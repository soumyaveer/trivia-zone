class Trivia < ActiveRecord::Base
  has_many :trivia_sessions
  has_many :users, through: :trivia_sessions

end
