class ChangeMinAndMaxAgeColumnsToAgeRangeOnUsers < ActiveRecord::Migration
  def change
    remove_column :users, :desired_min_age
    remove_column :users, :desired_max_age
    add_column :users, :desired_age_range, :string
  end
end
