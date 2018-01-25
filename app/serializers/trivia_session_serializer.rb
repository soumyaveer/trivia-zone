class TriviaSessionSerializer < ActiveModel::Serializer
  attributes :id, :feedback, :score, :meta

  belongs_to :trivia

  def meta
    trivia_session = self.object
    player = trivia_session.player
    trivia_sessions = player.trivia_sessions.order_by_created_at_asc

    current_trivia_session_index = trivia_sessions.index(trivia_session)
    previous_record = current_trivia_session_index.zero? ? nil : trivia_sessions[current_trivia_session_index - 1]
    next_record = trivia_sessions[current_trivia_session_index + 1]

    {
      next: next_record&.id,
      previous: previous_record&.id
    }
  end
end
