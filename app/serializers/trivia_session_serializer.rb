class TriviaSessionSerializer < ActiveModel::Serializer
  attributes :id, :feedback, :score

  belongs_to :trivia
end
