class TriviaSession < ApplicationRecord
  belongs_to :player, class_name: "User"
  belongs_to :trivia
  has_and_belongs_to_many :answers

  accepts_nested_attributes_for :answers

  scope :order_by_created_at, (-> { order(created_at: :desc) })

  def score
    (self.answers.correct.size / self.answers.size.to_f) * 100.00
  end
end
