class RemoveCategoryIdColumnFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :category_id, :integer
  end
end
