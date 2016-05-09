class RemoveViableUsersColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :viable_users
  end
end
