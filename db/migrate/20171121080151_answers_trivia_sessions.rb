class AnswersTriviaSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :answers_trivia_sessions do |t|
      t.integer :answer_id, null: false
      t.integer :trivia_session_id, null: false
    end
  end
end
