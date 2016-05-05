class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :question_id
      t.integer :answer
      t.integer :desired_answer, array: true, default: []
      t.integer :importance
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
