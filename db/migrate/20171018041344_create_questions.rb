class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :description
      t.integer :trivia_id

      t.timestamps null: false
    end
  end
end
