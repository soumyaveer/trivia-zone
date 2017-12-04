class AddFeedbackToTriviaSession < ActiveRecord::Migration[5.1]
  def change
    add_column :trivia_sessions, :feedback, :string
  end
end
