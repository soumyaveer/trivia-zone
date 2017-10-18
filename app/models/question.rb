class Question < ActiveRecord::Base
  belongs_to :trivia
  has_many :answers
end
