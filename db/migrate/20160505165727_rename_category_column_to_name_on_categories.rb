class RenameCategoryColumnToNameOnCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :category, :name
  end
end
