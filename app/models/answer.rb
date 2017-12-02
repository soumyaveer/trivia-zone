class Answer < ApplicationRecord
  belongs_to :question
  has_and_belongs_to_many :trivia_sessions
  validates :description, presence: true

  scope :correct, -> { where(correct: true) }
  scope :incorrect, -> { where(correct: false) }
end
