class MakeJsonKeysIntoColumnsOnQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :question
    add_column :questions, :user_text, :string
    add_column :questions, :match_text, :string
    add_column :questions, :answers, :json
  end
end
