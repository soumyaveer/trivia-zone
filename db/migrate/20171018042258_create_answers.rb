class CreateAnswers < ActiveRecord::Migration[5.1]
  def change
    create_table :answers do |t|
      t.text :description
      t.integer :question_id
      t.boolean :correct, default: false

      t.timestamps null: false
    end
  end
end
