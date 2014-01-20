class RemoveAdminsFromGroups < ActiveRecord::Migration
  def change
    remove_column :groups, :admins
  end
end
