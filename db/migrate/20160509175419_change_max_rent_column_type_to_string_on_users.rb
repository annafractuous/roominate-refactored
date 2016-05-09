class ChangeMaxRentColumnTypeToStringOnUsers < ActiveRecord::Migration
  def change
    change_column :users, :max_rent, :string
  end
end
