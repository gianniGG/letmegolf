class RemoveUsersFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :users, :string
  end
end
