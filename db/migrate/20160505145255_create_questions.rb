class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.json :question

      t.timestamps null: false
    end
  end
end
