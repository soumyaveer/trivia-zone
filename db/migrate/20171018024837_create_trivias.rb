class CreateTrivias < ActiveRecord::Migration[5.1]
  def change
    create_table :trivia do |t|
      t.string :title
      t.text :description
      t.integer :topic_id
      t.integer :author_id

      t.timestamps null: false
    end
  end
end
