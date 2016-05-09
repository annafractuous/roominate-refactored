class AddViableUsersColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :viable_users, :integer, array: true, default: []
  end
end
