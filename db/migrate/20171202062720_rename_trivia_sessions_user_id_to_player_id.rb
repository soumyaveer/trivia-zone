class RenameTriviaSessionsUserIdToPlayerId < ActiveRecord::Migration[5.1]
  def change
    rename_column :trivia_sessions, :user_id, :player_id
  end
end
