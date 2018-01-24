class TriviaSerializer < ActiveModel::Serializer
  attributes :id, :title

  has_many :trivia_sessions
end
