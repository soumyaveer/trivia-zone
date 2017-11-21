class RemoveScoreFromTriviaSessions < ActiveRecord::Migration[5.1]
  def change
    remove_column :trivia_sessions, :score, :integer
  end
end
