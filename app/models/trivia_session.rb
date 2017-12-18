class TriviaSession < ApplicationRecord
  belongs_to :player, class_name: "User"
  belongs_to :trivia
  has_and_belongs_to_many :answers

  scope :order_by_created_at, (-> { order(created_at: :desc) })

  def score
    return 0.0 if self.answers.blank?

    (self.answers.correct.size / self.answers.size.to_f) * 100.00
  end

  #{"question"=>{"1"=>{"answer_id"=>"1"}, "2"=>{"answer_id"=>"4"}}}
  def question=(questions_hash)
    answer_attribute_sets = questions_hash.values

    answer_ids = answer_attribute_sets.map do |answer_attributes|
      answer_attributes[:answer_id]
    end

    self.answers = Answer.where(id: answer_ids)
  end

  def self.for_player(player)
    where(player_id: player.id)
  end
end
