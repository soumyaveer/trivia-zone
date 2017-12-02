class TriviaSession < ActiveRecord::Base
  # belongs_to :player, class_name: "User" # TODO: rename to player
  belongs_to :user
  belongs_to :trivia
  has_and_belongs_to_many :answers

  accepts_nested_attributes_for :answers

  scope :order_by_created_at, (-> { order(created_at: :desc) })

  def score
    (self.answers.correct.size / self.answers.size.to_f) * 100.00
  end
end
