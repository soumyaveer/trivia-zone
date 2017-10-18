class CreateTriviaSessions < ActiveRecord::Migration[5.1]
  def change
    create_table :trivia_sessions do |t|
      t.integer :user_id
      t.integer :trivia_id
      t.integer :score

      t.timestamps null: false
    end
  end
end
