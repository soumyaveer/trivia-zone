class TriviaSession < ActiveRecord::Base
  belongs_to :user # TODO: rename to player
  belongs_to :trivia
  has_and_belongs_to_many :answers

  accepts_nested_attributes_for :answers

  def score
    (self.answers.correct.size / self.answers.size.to_f) * 100.00
  end
end
