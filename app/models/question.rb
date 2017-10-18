class Question < ActiveRecord::Base
  belongs_to :trivia
  has_many :answers

  validates :description, presence: true
end
