class TriviaSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :topic
  has_many :trivia_sessions
end
