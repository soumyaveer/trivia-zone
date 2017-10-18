class CreateTrivias < ActiveRecord::Migration[5.1]
  def change
    create_table :trivias do |t|
      t.string :title
      t.text :description
      t.integer :topic_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
